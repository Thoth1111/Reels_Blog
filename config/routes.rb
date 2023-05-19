Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root 'users#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create,]
    end
  end
end
