class AppConfig < ActiveRecord::Base
  AVAILABLE_TYPES = %w(string integer float boolean)

  validates :value_type, inclusion: { in: AVAILABLE_TYPES }
  validate :value_contains_correct_data

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
    str == 'true' || str == 'false'
  end
end
