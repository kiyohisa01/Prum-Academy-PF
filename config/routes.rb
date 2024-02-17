Rails.application.routes.draw do
  root   "sessions#new"
  get    "/signup",  to:"users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout_path",  to: "sessions#destroy"

  get    "users/index",      to: "users#index"
  post   "users/create",     to: "users#create"
  get    "users/new",        to: "users#new"
  get    "users/:id/edit",   to: "users#edit"
  get    "users/:id",        to: "users#show"
  patch  "users/:id",        to: "users#update"
  put    "users/:id",        to: "users#update"
  delete "users/:id",        to: "users#destroy"

  get   "skills/skill_create_back_this_month",  to: "skills#skill_create_back_this_month"
  get   "skills/skill_create_back_last_month",  to: "skills#skill_create_back_last_month"
  get   "skills/skill_create_back_two_month",  to: "skills#skill_create_back_two_month"
  get   "skills/skill_create_front_this_month",  to: "skills#skill_create_front_this_month"
  get   "skills/skill_create_front_last_month",  to: "skills#skill_create_front_last_month"
  get   "skills/skill_create_front_two_month",  to: "skills#skill_create_front_two_month"
  get   "skills/skill_create_infra_this_month",  to: "skills#skill_create_infra_this_month"
  get   "skills/skill_create_infra_last_month",  to: "skills#skill_create_infra_last_month"
  get   "skills/skill_create_infra_two_month",  to: "skills#skill_create_infra_two_month"


  resources :users
  resources :skills
  resources :learnings
  
  get 'users/index'

end
