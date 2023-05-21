Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/api-docs/v1/swagger.yaml', to: redirect('/swagger/v1/swagger.yml')

  # Defines the root path route ("/")
  root 'users#index'

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index, :create, :destroy] do
          resources :comments, only: [:index, :create, :destroy]
          resources :likes, only: [:index, :create, :destroy]
        end
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create,]
    end
  end
end
