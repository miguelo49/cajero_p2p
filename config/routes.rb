Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :exchanges, only: [:index, :new, :update, :create]
  resources :user_exchanges, only: [:index]
  resources :users, only: [:new, :create]
end