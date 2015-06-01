Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :users
  resources :orders, only: [:index, :show]
end
