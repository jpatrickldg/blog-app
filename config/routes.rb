Rails.application.routes.draw do
  resources :posts, :path => "blogs" 
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
  get '/dashboard' => 'home#dashboard'
  get '/users/:id/blogs' => 'posts#blogs', as: 'user_blogs'
end
