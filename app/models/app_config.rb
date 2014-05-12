class AppConfig < ActiveRecord::Base
  AVAILABLE_TYPES = %w(string integer float boolean)

  validates :type, inclusion: { in: AVAILABLE_TYPES }
end
