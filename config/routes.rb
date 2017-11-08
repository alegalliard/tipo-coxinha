Rails.application.routes.draw do

  resources :products, only: [:new, :create, :show]
  devise_for :users
  root to: 'home#index'
end
