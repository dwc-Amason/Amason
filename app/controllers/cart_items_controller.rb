class CartItemsController < ApplicationController
    def index
    @cart_items = current_user.cart_items

    end

    def create
	    @cart_items = CartItem.new(cart_item_params)
    	@cart_items.save
    end
end

private
	def cart_item_params
	   	params.require(:cart_item).permit(:id, :number, :user_id, :item_id)
	end
