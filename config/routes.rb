Rails.application.routes.draw do
  root "sessions#new"
  get "/signup", to:"users#new"
  get "/introduce-edit", to:"users#edit"
  # get "/top-loggedin", to:"users#loggedin"
  # get "/skill-edit", to:"skills#edit"
  # get "/skill-new", to:"skills#skill-new"
end
