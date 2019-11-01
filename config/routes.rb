Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/cyrwheel',    to: 'static_pages#cyrwheel'
  get  '/signup',  to: 'users#new'
  get '/search' => 'users#search', :as => 'search_users'
  get  '/users',  to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end