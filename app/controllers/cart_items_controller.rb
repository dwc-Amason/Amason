class CartItemsController < ApplicationController

	before_action :check_id, only:[:create]

	def index
		@cart_items = CartItem.where(user_id: current_user.id)
	end

	def show
		@user = current_user
		@cart_items = current_user.cart_items
		@Shipping_address = ShippingAddress.find(params[:id])
	end

	def check_id
		cart_items = current_user.cart_items
		cart_items.each do |cart|
			if cart.item_id == params[:id].to_i
				flash[:notice] = "既に同じ商品がカートに追加されています。カートから数量を変更してください。"
				redirect_to root_path
			end
		end
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

