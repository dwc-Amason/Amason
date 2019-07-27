Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwors',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users  do
    resources :shipping_addresses
   end
  resources :items
  resources :cart_items
  resources :orders
  resources :labels
  resources :artists
  resources :genres
  root "items#index"
  get "/admins/link" => "admins#link"
  get "/admins/userIndex" => "admins#userIndex"
  get "/admins/itemIndex" => "admins#itemIndex"
  get "/admins/order" => "admins#order"
  get 'admins/itemShow/:id', to: 'admins#itemShow', as: 'admins_itemShow'
  get 'admins/userShow/:id', to: 'admins#userShow', as: 'admins_userShow'
  get 'admins/orderShow/:id', to: 'admins#orderShow', as: 'admins_orderShow'
  get 'admins/itemEdit/:id', to: 'admins#itemEdit', as: 'admins_itemEdit'
  get 'admins/discEdit/:id', to: 'admins#discEdit', as: 'admins_discEdit'
  get 'admins/shipping_address/:id', to: 'admins#shipping_address', as: 'admins_shipping_address'
  get 'admins/enduser_order/:id', to: 'admins#enduser_order', as: 'admins_enduser_order'
  get "/admin/itemview" => "admin#itemview"

  get "/search" => "items#search"
  get "/admins/search" => "admins#search"

end
