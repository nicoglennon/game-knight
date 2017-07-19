Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  get '/sessions/new', to: 'sessions:new', as: 'new_session'
  resources :users
end
