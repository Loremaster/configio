require 'spec_helper'

describe AppConfig do
  it { should ensure_inclusion_of(:value_type).in_array(AppConfig::AVAILABLE_TYPES) }

  describe "methods" do
    let(:conf) { FactoryGirl.create(:app_config) }

    describe "pretty_value" do
      it "should return string value if it is not boolean" do
        conf.pretty_value.should == 'some string'
      end

      it "should return true if value is '1'" do
        b_conf = FactoryGirl.create(:bool_app_config, value: '1')
        b_conf.pretty_value.should == true
      end

      it "should return false if value is '0'" do
        b_conf = FactoryGirl.create(:bool_app_config, value: '0')
        b_conf.pretty_value.should == false
      end
    end
  end

  describe "custom validations" do
    describe "value" do
      describe "string" do
        it "is valid if it's string with data" do
          AppConfig.new(value_type: 'string', value: 'some string').should be_valid
        end

        it "is valid if it's empty string" do
          AppConfig.new(value_type: 'string', value: '').should be_valid
        end

        it "is invalid if it's integer" do
          AppConfig.new(value_type: 'string', value: 100500).should_not be_valid
        end

        it "is invalid if it's nil" do
          AppConfig.new(value_type: 'string', value: nil).should_not be_valid
        end
      end

      describe "integer" do
        it "is valid if it's string with integer" do
          AppConfig.new(value_type: 'integer', value: '100500').should be_valid
        end

        it "is invalid if it's string with float" do
          AppConfig.new(value_type: 'integer', value: '100.500').should_not be_valid
        end

        it "is invalid if it's integer" do
          AppConfig.new(value_type: 'integer', value: 100500).should_not be_valid
        end

        it "is invalid if it's nil" do
          AppConfig.new(value_type: 'integer', value: nil).should_not be_valid
        end
      end

      describe "boolean type" do
        it "is valid if it's 'true'" do
          AppConfig.new(value_type: 'boolean', value: '1').should be_valid
        end

        it "is valid if it's 'false'" do
          AppConfig.new(value_type: 'boolean', value: '0').should be_valid
        end

        it "is valid if it's 'true'" do
          AppConfig.new(value_type: 'boolean', value: 'true').should_not be_valid
        end

        it "is valid if it's 'false'" do
          AppConfig.new(value_type: 'boolean', value: 'false').should_not be_valid
        end

        it "is invalid if it'string, with random data" do
          AppConfig.new(value_type: 'boolean', value: 'random').should_not be_valid
        end

        it "is invalid if it's empty string" do
          AppConfig.new(value_type: 'boolean', value: '').should_not be_valid
        end

        it "is invalid if it's true" do
          AppConfig.new(value_type: 'boolean', value: true).should_not be_valid
        end

        it "is invalid if it's false" do
          AppConfig.new(value_type: 'boolean', value: false).should_not be_valid
        end

        it "is invalid if it's 1" do
          AppConfig.new(value_type: 'boolean', value: 1).should_not be_valid
        end

        it "is invalid if it's 0" do
          AppConfig.new(value_type: 'boolean', value: 0).should_not be_valid
        end

        it "is invalid if it's nil" do
          AppConfig.new(value_type: 'boolean', value: nil).should_not be_valid
        end
      end

      describe "float" do
        it "is valid if it's string with float" do
          AppConfig.new(value_type: 'float', value: '100.500').should be_valid
        end

        it "is invalid if it's string with integer" do
          AppConfig.new(value_type: 'float', value: '100500').should_not be_valid
        end

        it "is invalid if it's float" do
          AppConfig.new(value_type: 'float', value: 100.500).should_not be_valid
        end

        it "is invalid if it's nil" do
          AppConfig.new(value_type: 'float', value: nil).should_not be_valid
        end
      end
    end
  end
end
