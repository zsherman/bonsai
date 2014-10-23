Rails.application.routes.draw do
  resources :images

  resources :unlock_codes

  resources :purchases

  resources :orders

  resources :line_items

  resources :carts

  resources :products

  #mount Upmin::Engine => '/admin'
  root to: 'pages#home'

  # Setup Devise
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions", registrations: "registrations"}
  resources :users

  # Box routes
  # get 'products' => 'products#index', :as => 'products'
  # get 'product/:permalink' => 'products#show', :as => 'product'
  # post 'product/:permalink' => 'products#buy', :as => 'buy'

  # Shopping cart routes

  # Checkout routes

end
