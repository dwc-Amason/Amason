class CartItemsController < ApplicationController
	def index
	  @cart_items = CartItem.find(session[:cart_item])
	end

	def create
	   session[:cart_item] = [] unless session[:cart_item]
       session[:cart_item] << params[:item_id]
       redirect_to cart_path
    end


end
