class CartItemsController < ApplicationController
	def index
		@cart_items = current_cart.cart_items
		@user = User.find(params[:id])
	end
end
