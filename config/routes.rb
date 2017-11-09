Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/search', to: 'search#index', as: 'search_by_region'
end
