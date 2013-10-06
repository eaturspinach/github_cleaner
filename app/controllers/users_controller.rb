class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:show]

	def show
		@authentication = Authentication.find_by_uid(session[:uid])
		@user = User.find_by_id(@authentication)
		# @repos = @user.repositories.all
  	end

  	private

  		def signed_in_user
  			redirect_to signin_url, :notice => "Please sign in." unless signed_in?
  		end

end
