Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
