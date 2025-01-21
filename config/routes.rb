Rails.application.routes.draw do
  root 'home#index'
  resources :categories, only: [:index, :show]
  resources :videos, only: [:index, :show] do
    member do
      post :increment_likes
    end
    resources :comments, only: [:create, :destroy]
  end
  resource :session
  resource :registration, only: [:new, :create]
  resources :passwords, param: :token
  get "up" => "rails/health#show", as: :rails_health_check
end
