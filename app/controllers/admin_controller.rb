class AdminController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@shipping_addresses = ShippingAddress.all
		@orders = Order.all
	end

	def order
	end

	def link
  	end

end
