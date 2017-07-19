Rails.application.routes.draw do

  root to: 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :games, only: [:show, :index]
  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]

end
