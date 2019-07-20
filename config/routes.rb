Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :cart_items
  resources :orders
  resources :shipping_addresses
  resources :labels
  resources :artists
  resources :genres
  root "items#index"
  get "/admins/link" => "admin#link"
  get "/admins/userIndex" => "admin#userIndex"
  get "/admins/order" => "admin#order"
  get 'admins/itemShow/:id', to: 'admin#itemShow', as: 'admins_itemShow'
  get 'admins/userShow/:id', to: 'admin#userShow', as: 'admins_userShow'
  get 'admins/orderShow/:id', to: 'admin#orderShow', as: 'admins_orderShow'
  get "/admin/itemview" => "admin#itemview"

end
