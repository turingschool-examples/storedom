Rails.application.routes.draw do

  root 'stores#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get ':store_slug', to: 'stores#show', as: :store

  get ':store_slug/items', to: 'store/items#index', as: :store_items
  get ':store_slug/items/:id', to: 'store/items#show', as: :store_item

end
