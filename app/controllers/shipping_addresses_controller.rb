class ShippingAddressesController < ApplicationController

	def edit
		@shipping_address = Shipping_address.find(params[:id])
		@shipping_addresses = Shipping_address.page(params[:page]).per(5)
	end

	def new
		@shipping_address = Shipping_address.new(shipping_address_params)
	end

	def index
		@shipping_addresses = Shipping_address.all
	end

	private
	def shipping_address_params
	   	params.require(:shipping_address).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :delete_flag)
	end
end
