Rails.application.routes.draw do
  devise_for :users

  resources :home, only: :show
  resources :user_locations, only: :create
  root 'home#show'
end
