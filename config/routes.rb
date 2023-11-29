Rails.application.routes.draw do
  root "sessions#new"
  get "/signup", to:"users#new"
  get "/introduce-edit", to:"users#edit"
  # get "/users/top-loggedin", to:"users#show"
  # get "/skill-edit", to:"skills#edit"
  # get "/skill-new", to:"skills#skill-new"
  # resources :users
end
