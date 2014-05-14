require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AppConfigsHelper. For example:
#
# describe AppConfigsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe AppConfigsHelper do
  describe "active_link?" do
    it "returns empty string for input empty string" do
      expect(helper.active_link?("")).to eq("")
    end

    describe "stubbed" do
      before(:each) do
        controller.stub(:controller_name).and_return('city')
        controller.stub(:action_name).and_return('index')
      end

      it "returns empty string if current controller and action isn't active link" do
        expect(helper.active_link?("pages#home")).to eq("")
      end

      it "returns empty string if if '#' devider is not provided" do
        expect(helper.active_link?("cityindex")).to eq("")
      end

      it "returns 'active' if current page is active" do
        expect(helper.active_link?("city#index")).to eq("active")
      end
    end
  end
end
