require 'spec_helper'

describe UsersController do
	
	render_views

	let(:user) { FactoryGirl.create(:user) }
	let (:authentication) { FactoryGirl.create(:authentication) }

	before(:each) do
		Github = mock(Github)
		Github.stub_chain(:repos,:list).and_return([])
	end

  	describe "GET 'show'" do

		it "returns http success" do
			test_sign_in
			get 'show'
			response.should be_success
		end

  	end

	describe "#show" do
	  	
		it "redirects to sign in page if user IS NOT signed in" do
			get :show
			response.code.should == "302" # redirects to signin_url if not signed in - 302 is an http redirect status code
			response.should redirect_to signin_url
		end

		it "redirects user to user#show page if user IS signed in" do
			test_sign_in
			get :show
			response.code.should == "200"
		end

	end

end
