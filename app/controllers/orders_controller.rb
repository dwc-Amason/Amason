class OrdersController < ApplicationController
	def index
		@orders = Order.all
		@order = Order.page(params[:page]).per(5)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@cart_items = Cart_item.all
		@order_item == @cart_item
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			redirect_to order_path(@order)
		else
			@cart_items = Cart_item.all
			render :new
		end
	end



	private

	def order_params
	   	params.require(:order).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :email, :status, :total_price, :payment, :carriage)
	end
end
