Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show, :new]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items,  only: [:index, :show]
      get "/items/:id/fancy" => "items#fancy"
      resources :users,  only: [:index, :show]
    end
  end
end
