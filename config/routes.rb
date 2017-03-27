Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get ':slug', to: "stores#show", as: "store"

  namespace :stores, path: ":slug" do
    resources :items
  end
end
