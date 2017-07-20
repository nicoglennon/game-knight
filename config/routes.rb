Rails.application.routes.draw do

  root to: 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'pages#search'

  resources :users
  resources :games, only: [:show, :index]
  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]

end
