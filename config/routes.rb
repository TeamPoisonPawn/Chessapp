Rails.application.routes.draw do
  devise_for :users
  root 'home_page#index'
  resources :pieces, only: [:show, :update]
  resources :games, only: [:new, :create, :show, :update]
end
