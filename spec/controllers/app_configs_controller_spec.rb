require 'spec_helper'

describe AppConfigsController do
  let(:conf) { FactoryGirl.create(:app_config) }
  let(:attrs) { {value_type: 'string', value: 'some string'} }

  describe "GET 'index'" do
    it "should be success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be success" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should redirect to list of configs" do
      post :create, app_config: attrs
      response.should redirect_to(app_configs_path)
    end

    it "should show message that config created" do
      post :create, app_config: attrs
      flash[:success].should eq "Configuration created!"
    end
  end

  describe "GET 'edit'" do
    it "should be success" do
      get :edit, id: conf
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should redirect to list of configs" do
      put :update, id: conf, app_config: attrs
      response.should redirect_to(app_configs_path)
    end

    it "should show message that config updated" do
      put :update, id: conf, app_config: attrs
      flash[:success].should eq "Configuration updated!"
    end
  end

  describe "DELETE 'destroy'" do
    it "should redirect to list of configs" do
      delete :destroy, id: conf
      response.should redirect_to(app_configs_path)
    end

    it "should show message that config updated" do
      delete :destroy, id: conf
      flash[:notice].should eq "Configuration deleted."
    end
  end

  describe "GET 'search'" do
    it "should render page" do
      get :search, q: conf.value
      response.should be_success
    end

    it "should find data" do
      get :search, q: conf.value
      expect(assigns(:app_configs)).to include(conf)
    end
  end
end
