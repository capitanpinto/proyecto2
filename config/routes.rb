Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get  '/cyrwheel',    to: 'static_pages#cyrwheel'
  get  '/signup',  to: 'users#new'
  resources :users
end