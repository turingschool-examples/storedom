Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items
    end
  end

  namespace :admin do
    resources :items, :only => [:edit, :new, :create, :update]
  end
end
