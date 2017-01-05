Rails.application.routes.draw do
  devise_for :users
  root 'home_page#index'

  resources :games, only: :show
  
end
