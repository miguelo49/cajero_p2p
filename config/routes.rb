Rails.application.routes.draw do
  root 'home#index'
  
  resources :exchanges, only: [:new, :index, :show, :create]
  resources :users, only: [:new, :create, :edit, :update]
end