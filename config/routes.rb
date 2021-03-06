Rails.application.routes.draw do
  root to: "welcome#index"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy', as: :logout

  resources :github_users, only: [:show]
end
