# Note: This MUST BE REMOVED if you're using Devise's omniauthable, or Devise will report "invalid credentials" when attempting to log in via Twitter

Rails.application.config.middleware.use OmniAuth::Builder do
  # option: :force_login => true will force a new login into the Provider, even though the Provider may have previously been logged in, from a different browser tab.
  provider :github, AppConfig['github_api_key'], AppConfig['github_api_secret'] 
end