class CartItemsController < ApplicationController

	before_action :check_id, only:[:create]

	def index
		@cart_items = CartItem.where(user_id: current_user.id)
		@cart_items = @cart_items.page(params[:page]).per(5)
	end

	def show
		@user = current_user
		@cart_items = current_user.cart_items
		@Shipping_address = ShippingAddress.find(params[:id])
		@order = Order.new
		@order.order_items.build
        @shipping_addresses = ShippingAddress.where(user_id: current_user.id)
		@shipping_addresses = @shipping_addresses.page(params[:page]).per(3)
	end

    def create
    	check_id
	    @cart_item = CartItem.new(cart_item_params)
    	@cart_item.save
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
	   	params.require(:cart_item).permit(:id, :number, :user_id, :item_id )
	end

	def check_id
		cart_item =  CartItem.find_by("item_id = ? and user_id = ?", params[:cart_item][:item_id], params[:cart_item][:user_id])
		unless cart_item.nil?
			cart_item.number += params[:cart_item][:number].to_i
			cart_item.save
			flash[:notice] = "既に同じ商品がカートに追加されています。カートから数量を変更してください。"
			redirect_to cart_items_path
		end
	end
end

