Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/cyrwheel',    to: 'static_pages#cyrwheel'
  get  '/signup',  to: 'users#new'
  get  '/users',  to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :microposts,          only: [:create, :destroy]
end