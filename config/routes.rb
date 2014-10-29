Rails.application.routes.draw do
  resources :ingredients

  resources :courses

  mount Upmin::Engine => '/admin'
  resources :images
  resources :unlock_codes
  resources :purchases
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  root to: 'pages#home'

  # Setup Devise
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions", registrations: "registrations"}
  resources :users

  post 'purchase' => 'purchases#create', :as => 'purchased'

  get 'cart' => 'carts#show', :as => 'current_cart'
  get 'sync_orders' => 'orders#sync_orders', :as => 'sync_orders'

  # Box routes
  # get 'products' => 'products#index', :as => 'products'
  # get 'product/:permalink' => 'products#show', :as => 'product'
  # post 'product/:permalink' => 'products#buy', :as => 'buy'

  # Shopping cart routes

  # Checkout routes

end
