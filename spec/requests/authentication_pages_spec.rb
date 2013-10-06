require "spec_helper"

describe "Authentication" do

	describe "signin" do

		describe "success" do
			
			before do
				Github = mock(Github)
				Github.stub_chain(:repos,:list).and_return([])
			end
			
			it "signs a user in" do
				visit signin_path
				click_link "Sign in through Github" 
				page.should have_selector("title", text: "Your Repos")
			end

		end

		describe "failure" do

			it "does not sign a user in" do
				OmniAuth.config.mock_auth[:github] = :invalid_credentials
				visit signin_path
				click_link "Sign in through Github" 
				page.should have_selector("title", text: "Sign In")
			end

		end

	end
	
end