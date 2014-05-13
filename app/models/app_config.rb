class AppConfig < ActiveRecord::Base
  AVAILABLE_TYPES = %w(string integer float boolean)

  after_commit :flush_cache

  validates :value_type, inclusion: { in: AVAILABLE_TYPES }
  validate :value_contains_correct_data

  def self.cached_all
    Rails.cache.fetch("app_config_all") { AppConfig.all }
  end

  def pretty_value
    current_value = read_attribute(:value)

    if value_type == 'boolean'
      to_bool(current_value)
    else
      current_value
    end
  end

  private

  def value_contains_correct_data
    validation_res = case value_type
      when 'string'
        value.is_a?(String)
      when 'integer'
        value.is_a?(String) && is_num?(value)
      when 'boolean'
        value.is_a?(String) && is_bool?(value)
      when 'float'
        value.is_a?(String) && is_float?(value) && value.include?(".")
    end

    errors.add(:value, "contains invalid data") if validation_res == false
  end

  def is_num?(str)
    !!Integer(str) rescue false
  end

  def is_float?(str)
    !!Float(str) rescue false
  end

  def is_bool?(str)
    str == '1' || str == '0'
  end

  def to_bool(str)
    if str == '1'
      true
    elsif str == '0'
      false
    end
  end

  def flush_cache
    Rails.cache.delete("app_config_all")
  end
end
