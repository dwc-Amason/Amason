class CartItemsController < ApplicationController

	def index
		@cart_items = CartItem.where(user_id: current_user.id)
		@cart_items = CartItem.page(params[:page]).per(10)
	end

	def show
		@user = current_user
		@cart_items = current_user.cart_items
		@Shipping_address = ShippingAddress.find(params[:id])
		@order = Order.new
        @shipping_addresses = ShippingAddress.all
		@shipping_addresses = ShippingAddress.page(params[:page]).per(2)
	end

    def create
	    @cart_items = CartItem.new(cart_item_params)
    	@cart_items.save
    	redirect_to cart_items_path(@cart_item)
    end

  	def destroy
  		@cart_item = CartItem.find(params[:id])
  		if @cart_item.destroy
  			redirect_to cart_items_path
  		else
			@cart_items = CartItem.where(user_id: current_user.id)
  			render :index
  		end
  	end

	private
	def cart_item_params
	   	params.require(:cart_item).permit(:id, :number, :user_id, :item_id)
	end
end

