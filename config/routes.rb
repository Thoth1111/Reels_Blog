Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end  
  # Defines a new route for a new post for a specific user
  get 'new_post', to: 'posts#new'
  post 'create_post', to: 'posts#create'
  get 'new_comment', to: 'comments#new'
  post 'create_comment', to: 'comments#create'
  post 'create_like', to: 'likes#create'
end

