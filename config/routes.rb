Rails.application.routes.draw do
  root   "sessions#new"
  get    "/signup",  to:"users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get   "skills/skill_create_back_this_month",  to: "skills#skill_create_back_this_month"
  get   "skills/skill_create_back_last_month",  to: "skills#skill_create_back_last_month"
  get   "skills/skill_create_back_two_month",  to: "skills#skill_create_back_two_month"
  get   "skills/skill_create_front_this_month",  to: "skills#skill_create_front_this_month"
  get   "skills/skill_create_front_last_month",  to: "skills#skill_create_front_last_month"
  get   "skills/skill_create_front_two_month",  to: "skills#skill_create_front_two_month"
  get   "skills/skill_create_infra_this_month",  to: "skills#skill_create_infra_this_month"
  get   "skills/skill_create_infra_last_month",  to: "skills#skill_create_infra_last_month"
  get   "skills/skill_create_infra_two_month",  to: "skills#skill_create_infra_two_month"
  delete "skills/:id",  to: "skills#destroy"

  resources :users
  resources :skills
  resources :learnings
  
  

end
