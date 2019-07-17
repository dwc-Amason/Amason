class CartItemsController < ApplicationController
	def index
<<<<<<< HEAD
	  @cart_items = current_user.cart_items
=======


>>>>>>> master
	end

    def create
    @cart_item = CartItem.new
    @cart_item.save
    end
end
