Rails.application.routes.draw do
  # get 'tweets/new'
  # get 'tweets/show'
  # get 'tweets/index'
  # get 'tweets/create'
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :tweets
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
