Rails.application.routes.draw do
  mount Shoppe::Engine => "/shoppe"
  #mount Upmin::Engine => '/admin'
  root to: 'pages#home'

  # Setup Devise
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions", registrations: "registrations"}
  resources :users

  # Box routes
  get 'products' => 'products#index', :as => 'products'
  get 'product/:permalink' => 'products#show', :as => 'product'
  post 'product/:permalink' => 'products#buy', :as => 'buy'

  # Shopping cart routes
  get 'basket' => 'orders#show'
  delete 'basket' => 'orders#destroy'

  # Checkout routes
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :post]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :post]
end
