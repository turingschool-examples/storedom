Rails.application.routes.draw do
  root 'items#index'

  resources :items,    only:   [:index, :show]
  resources :orders,   only:   [:index, :show]
  resources :users,    except: [:edit, :destroy]
  resources :cart_items

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
