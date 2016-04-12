Rails.application.routes.draw do
  root 'items#index'

  namespace :api do
    namespace :v1 do
      resources :items, defaults: {format: :json}
    end
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
