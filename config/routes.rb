Rails.application.routes.draw do
  resources :games, only: [:show, :index]
  resources :categories, only: [:show]
  resources :mechanisms, only: [:show]
end
