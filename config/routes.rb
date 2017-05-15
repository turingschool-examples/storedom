Rails.application.routes.draw do
  root 'stores#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :stores, as: :store, path: ':store' do
    resources :items, only: [:index, :show]
  end
end
