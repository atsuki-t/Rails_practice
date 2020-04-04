Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :comments, only: %i[new edit create update destroy]
  end
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
