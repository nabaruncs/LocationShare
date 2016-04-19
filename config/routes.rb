Rails.application.routes.draw do
  devise_for :users

  resources :home, only: :show
  root 'home#show'
end
