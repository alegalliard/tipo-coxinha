Rails.application.routes.draw do
  resources :products, only: %i[new create show]
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'
  resources :profiles, only: %i[show create]
  get '/search', to: 'search#index', as: 'search_by_region'
  resources :proposals, only: %i[create show index]
end
