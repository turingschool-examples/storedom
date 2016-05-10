Rails.application.routes.draw do
  root 'stores#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get ':store', to: 'stores#show', as: :store

end
