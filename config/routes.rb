Rails.application.routes.draw do
  root "sessions#new"
  get "/signin", to:"users#new"
  get "/profile-edit", to:"users#profile-edit"
  # get "/top-loggedin", to:"users#loggedin"
  # get "/skill-edit", to:"skills#edit"
  # get "/skill-new", to:"skills#skill-new"
end
