Rails.application.routes.draw do

  root   "sessions#new"
  get    "/signup",  to:"users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout_path",  to: "sessions#destroy"

  get    "/learnings",  to:"learnings#index"
  post   "learnings/create",     to: "learnings#create"
  get    "learnings/new",        to: "learnings#new"
  get    "learnings/:id/edit",   to: "learnings#edit"
  patch  "learnings/:id",        to: "learnings#update"
  put    "learnings/:id",        to: "learnings#update"
  delete "learnings/:id",        to: "learnings#destroy"

  get   "learnings/learning_create_back_this_month",  to: "learnings#learning_create_back_this_month"
  get   "learnings/learning_create_back_last_month",  to: "learnings#learning_create_back_last_month"
  get   "learnings/learning_create_back_two_month",  to: "learnings#learning_create_back_two_month"
  get   "learnings/learning_create_front_this_month",  to: "learnings#learning_create_front_this_month"
  get   "learnings/learning_create_front_last_month",  to: "learnings#learning_create_front_last_month"
  get   "learnings/learning_create_front_two_month",  to: "learnings#learning_create_front_two_month"
  get   "learnings/learning_create_infra_this_month",  to: "learnings#learning_create_infra_this_month"
  get   "learnings/learning_create_infra_last_month",  to: "learnings#learning_create_infra_last_month"
  get   "learnings/learning_create_infra_two_month",  to: "learnings#learning_create_infra_two_month"

  resources :users
  resources :skills
  resources :learnings
  
  get 'users/index'

end
