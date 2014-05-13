FactoryGirl.define do
  factory :app_config do
    value_type 'string'
    value 'some string'
  end

  factory :bool_app_config, class: 'AppConfig' do
    value_type 'boolean'
    value '1'
  end
end