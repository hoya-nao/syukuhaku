Rails.application.routes.draw do
  get 'reservations/index'
  get 'posts/index' 
  get 'posts/roomshow'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  get "users/profile" => "users#profile"
  get 'users/index'
  
  root 'users#index'
  
  post 'posts/new' => 'posts#create'
  post 'posts/new'
  get 'posts/show'
  post 'posts/confirm'
  
  post 'posts/show' => 'reservations#reservation'
  post 'reservations/confirm'
  post 'reservations/confirm' => 'posts#reservation'
  post 'posts/confirm' => 'posts#confirm'
  post 'posts/confirm', to: 'reservations#confirm'
  get 'reservations/confirm'
  post 'reservations/show'
  
  resources :users
  resources :posts do
  get :search, on: :collection
  end
  
  resources :reservations
end