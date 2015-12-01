Rails.application.routes.draw do
  root 'stores#index'

  namespace :stores, path: ":store", as: :store do
    resources :items,  only: [:show, :index]
    resources :orders, only: [:show, :index]
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  get "/:store", to: "store#show"
end
