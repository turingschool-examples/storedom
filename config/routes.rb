Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items,  except: [:new, :edit]
      resources :orders, except: [:new, :edit]
      resources :users,  except: [:new, :edit]
    end
  end
end
