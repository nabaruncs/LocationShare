Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:show, :public_locations]
  resources :user_locations, only: :create
  root 'home#show'
  get '/:user_name', to: 'home#public_locations'
end
