Rails.application.routes.draw do
  mount Shoppe::Engine => "/shoppe"
  #mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
end
