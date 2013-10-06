require 'spec_helper'

describe RepositoriesController do

  describe "GET 'index'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "returns http success" do
      get 'index', :user_id => @user.id
      response.should be_success
    end
  end

end
