Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :carts
  resources :orders
  root "items#index"
  get "/admins/index" => "admins#index"
  get "/admins/link" => "admins#link"
end
