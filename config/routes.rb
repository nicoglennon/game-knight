Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'games#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :games, only: [:show, :index]
  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]

end
