Rails.application.routes.draw do
  root "exchanges#index"
  resources :exchanges, only: [:index]
  resources :users, only: [:show, :edit, :update]
end
