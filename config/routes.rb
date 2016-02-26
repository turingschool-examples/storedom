Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get "/cart", to: "cart_items#index"
  resources :cart_items, only: [:create]
end
