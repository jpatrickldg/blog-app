Rails.application.routes.draw do
  resources :posts do
    post :archive, on: :member
    post :republish, on: :member
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # unauthenticated :user do
  #   root 'home#index', as: :unauthenticated_root
  # end

  # authenticated :user do
  #   root 'dashboards#index', as: :authenticated_root
  # end
  get "/user_blogs" => 'posts#user_blogs'
end
