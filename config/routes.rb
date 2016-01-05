Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :users
  resources :orders, only: [:index, :show, :update, :create]

  namespace :api do
    namespace :v1 do
      resources :items, except: [:new, :edit], defaults: { format: :json }
    end
  end
end
