Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :shipping_addresses
  resources :labels
  resources :artists
  resources :genres
  root "items#index"
  get "/admins/index" => "admin#index"
  get "/admins/link" => "admin#link"
  get "/admins/order" => "admin#order"
end
