class OrdersController < ApplicationController
	def index
		@orders = Order.all
		@order = Order.page(params[:page]).per(5)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@cart_items = CartItem.all
		@order_item == @cart_item
	end

	def create
		@order = Order.new(params_int(order_params))
		#@order.payment = order_params[:payment]
		#binding.pry
		@order.user_id = current_user.id
		if @order.save!
			redirect_to order_path(@order)
		else
			@cart_items = CartItem.all
			render :new
		end
	end

	# def integer_string?(str)
	#    Integer(str)
	#    true
	#  rescue ArgumentError
	#    false
	# end

	def number?(str)
		nil != (str =~ /\A[0-9]+\z/)
	end

	private

	def order_params
	   	params.require(:order).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :email, :shipping_status, :payment)
	end

	def params_int(order_params)
    	order_params.each do |key,value|
	        if number?(value)
	        	order_params[key]=value.to_i
	        end
	    end
    end
end
