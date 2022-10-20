Rails.application.routes.draw do
  resources :posts do
    post :archive, on: :member
    post :republish, on: :member
  end
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  # unauthenticated :user do
  #   root 'home#index', as: :unauthenticated_root
  # end

  # authenticated :user do
  #   root 'dashboards#index', as: :authenticated_root
  # end
  get "/user_blogs" => 'posts#user_blogs'
  get '/dashboard' => 'home#dashboard'
  get '/blogs' => 'posts#blogs'
  resources :users do
    resources :posts, only: [:index]
  end
end
