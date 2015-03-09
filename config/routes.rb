Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  get '/holes/one'   => 'holes#one'
  get '/holes/two'   => 'holes#two'
  get '/holes/three' => 'holes#three'
  get '/holes/four'  => 'holes#four'
  get '/holes/five'  => 'holes#five'
  get '/holes/six'   => 'holes#six'
end
