Rails.application.routes.draw do


  get '/' => 'pages#index'
  resources :games, only: [:show, :index]
  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]
end
