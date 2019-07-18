class CartItemsController < ApplicationController

	def index
		@cart_items = current_cart.cart_items
	end

	def show
		@user = current_user
	end

    def create
	    @cart_items = CartItem.new(cart_item_params)
    	@cart_items.save
    	redirect_to cart_items_path(@cart_item)
    end

end

private
	def cart_item_params
	   	params.require(:cart_item).permit(:id, :number, :user_id, :item_id)
	end
