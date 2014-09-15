Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items,  only: [:index]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
