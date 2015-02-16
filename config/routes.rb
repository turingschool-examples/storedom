Rails.application.routes.draw do
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items,  only:   [:index, :show]
  resources :orders, only:   [:index, :show]
  resources :users,  only:   [:index, :show]
  resources :stores, only:   [:index, :show]

  root 'stores#index'
end
