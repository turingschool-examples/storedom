Rails.application.routes.draw do
  root 'stores#index'

  get 'stores/:id', to: "stores#show", as: :store

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
