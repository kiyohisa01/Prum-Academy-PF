Rails.application.routes.draw do
  root   "sessions#new"
  get    "/signup",  to:"users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get   "skills/skill_create_back",  to: "skills#skill_create_back"
  get   "skills/skill_create_front",  to: "skills#skill_create_front"
  get   "skills/skill_create_infra",  to: "skills#skill_create_infra"
  delete "skills/:id",  to: "skills#destroy"

  resources :users
  resources :skills
  
  

end
