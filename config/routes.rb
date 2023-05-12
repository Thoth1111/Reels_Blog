Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    # Defines a new route for a new post for a specific user
    get 'new', to: 'posts#new'
    post 'create', to: 'posts#create'
  end
end
