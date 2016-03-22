# Prefix Verb URI Pattern                        Controller#Action
#   root GET  /                                  stores#index
# store_items_index GET  /:store_name/items/index(.:format) stores/items#index
#  items GET  /items(.:format)                   items#index
#   item GET  /items/:id(.:format)               items#show
# orders GET  /orders(.:format)                  orders#index
#  order GET  /orders/:id(.:format)              orders#show
#  users GET  /users(.:format)                   users#index
#   user GET  /users/:id(.:format)               users#show

Rails.application.routes.draw do
  root 'stores#index'

  namespace :stores, path: ":store_name", as: :store do
    resources :items, only: [:index, :show]
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
