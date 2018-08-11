Rails.application.routes.draw do
  get 'categories/recommend'
  get 'categories/business'
  get 'categories/life'
  get 'categories/planning'
  get 'categories/technology'
  get 'categories/art'
  get 'categories/event'
  get 'categories/hobby'

  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  get 'pages/about'

  resources :users
  resources :topics
  resources :comments
  resources :collections

  post  'comments/new', to: 'comments#create'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
 end
