class AuthenticationsController < ApplicationController
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth["provider"],omniauth["uid"])
    if authentication
      redirect_to "#/repositories"
    else
      user = User.new
      user.authentications.build(:provider => omniauth["provider"], :uid => omniauth["uid"])
      user.name = omniauth["info"]["name"]
      user.email = omniauth["info"]["email"]
      user.nickname = omniauth["info"]["nickname"]
      # user.image = omniauth["info"]["image"]
      user.save!
      Repository.check_repos(user)
      redirect_to users_show_path
    end
    session[:name] = omniauth["info"]["name"]
    session[:uid] = omniauth["uid"]
    session[:provider] = omniauth["provider"]
    session[:image] = omniauth["info"]["image"]
  end
  
end
