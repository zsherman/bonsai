Rails.application.routes.draw do
  mount Shoppe::Engine => "/shoppe"
  #mount Upmin::Engine => '/admin'
  root to: 'pages#home'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  get 'products' => 'products#index', :as => 'products'
  get 'product/:permalink' => 'products#show', :as => 'product'
  post 'product/:permalink' => 'products#buy', :as => 'buy'
  get 'basket' => 'orders#show'
  delete 'basket' => 'orders#destroy'
end
