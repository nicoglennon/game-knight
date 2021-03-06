Rails.application.routes.draw do

  root to: 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'pages#search'

  resources :users

  resources :forums, only: [:show, :index] do
    resources :topics, except: [:index] do
      resources :posts, except: [:show, :index]
    end
  end

  resources :games, only: [:show, :index] do
    resources :reviews, shallow: true
  end

  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]
  resources :reviews, only: [:index]
  resources :ownerships, only: [:create, :destroy]
  resources :favoritings, only: [:create, :destroy]


end
