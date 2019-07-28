class OrdersController < ApplicationController
	def index
		@orders = Order.where(user_id: current_user.id)
		@orders = @orders.page(params[:page]).per(5)
	end

	def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
		@order_items = @order_items.page(params[:page]).per(5)
	end

	def new
		@user = current_user
		@cart_items = current_user.cart_items
		@Shipping_address = ShippingAddress.where(user_id: current_user.id)
		@order = Order.new
		@order.order_items.build
        @shipping_addresses = ShippingAddress.where(user_id: current_user.id)
		@shipping_addresses = @shipping_addresses.page(params[:page]).per(3)
@totalPrice = 0
		@cart_items.each do |cart_item|
			item = Item.find_by(id: cart_item.item_id)
			@totalPrice +=  cart_item.number * item.price
		end
	end

	def update
		@order = Order.find(params[:id])
	  	@order.update(order_params)
		redirect_to admins_order_path
	end

	def create
		@order = Order.new(params_int(order_params))
		@order.user_id = current_user.id
		@order.total_price = 0
		@order.order_items.each do |order_item|
			price = order_item.price * order_item.number
			@order.total_price += price
		end
		@order.total_price = @order.total_price * 1.08
		@order.total_price = @order.total_price.floor
		if @order.save
			@cart_items = current_user.cart_items
			@cart_items.each do |cart_item|
				item = Item.find_by(id: cart_item.item_id)
				item.stack -= cart_item.number
				item.save
			end
			@cart_items.destroy_all
			redirect_to items_path
		else
			@cart_items = CartItem.all
			render :new
		end
	end

	def number?(str)
		nil != (str =~ /\A[0-9]+\z/)
	end

	private

	def order_params
	   	params.require(:order).permit(:id,
	   								  :name_first,
   									  :name_last,
   									  :name_first_phonetic,
   									  :name_last_phonetic,
   									  :post_code,
   									  :address,
   									  :phone,
   									  :email,
   									  :shipping_status,
   									  :payment,
   									  order_items_attributes:[:id,
		   									  				  :price,
		   									 				  :number,
										 					  :order_id,
										 					  :user_id,
										 					  :item_id,
										 					  :created_at,
										 					  :updated_at])
	end

	def params_int(order_params)
    	order_params.each do |key,value|
	        if number?(value)
	        	order_params[key]=value.to_i
	        end
	    end
    end
end
