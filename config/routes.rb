Rails.application.routes.draw do
  root to: 'home#index'
  resources :products, only: [:new, :create, :show]
end
