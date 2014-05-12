require 'spec_helper'

describe AppConfig do
  it { should ensure_inclusion_of(:type).in_array(AppConfig::AVAILABLE_TYPES) }
end
