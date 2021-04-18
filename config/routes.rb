Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    resources :comments, only: %I[new edit create update destroy]
    resources :favorites, only: %I[create destroy]
  end
  get 'favorites', to: 'favorites#index'

  resources :users
  resources :memos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
