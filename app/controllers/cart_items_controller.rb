class CartItemsController < ApplicationController
	def index
		@cart_items = current_cart.cart_items
	end

	def show
		@user = current_user
	end

    def create
    @cart_item = CartItem.new
    @cart_item.save
    end

end
