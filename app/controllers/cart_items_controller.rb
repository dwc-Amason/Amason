class CartItemsController < ApplicationController

	def index
		@cart_items = CartItem.where(user_id: current_user.id)
	end

	def show
		@user = current_user
		@cart_items = current_user.cart_items
	end

    def create
	    @cart_items = CartItem.new(cart_item_params)
    	@cart_items.save
    	redirect_to cart_items_path(@cart_item)
    end

	private
	def cart_item_params
	   	params.require(:cart_item).permit(:id, :number, :user_id, :item_id)
	end
end


ShippingAddress.where(user_id: shipping_address.user.id)