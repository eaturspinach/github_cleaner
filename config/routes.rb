GithubCleaner::Application.routes.draw do
  resources :tags
  
  # resources :users do
  #   resources :repositories
  # end
  # 
  resources :repositories

  get "repositories/index"
  get "users/show"
  get "pages/home"
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'sessions#failure'
  match 'sign_out' => 'sessions#destroy'
  match '/signin',  to: 'sessions#new'
  match '/destroy_repos', to: 'repositories#destroy'

  root :to => "users#show"
end
