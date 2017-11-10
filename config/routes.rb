Rails.application.routes.draw do

  resources :products, only: [:new, :create, :show]
  devise_for :users, controllers: {registrations: "registrations"}
  root to: 'home#index'
  resources :profiles, only: [:show]
  get '/search', to: 'search#index', as: 'search_by_region'
end
