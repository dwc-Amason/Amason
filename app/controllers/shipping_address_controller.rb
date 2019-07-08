class ShippingAddressController < ApplicationController
	def new
	end

	def create
		@shipping_address = Shipping_address.new(shipping_address_params)
		@shipping_address.user_id = current_user.id
		if @shipping_address.save
			redirect_to shipping_addresses_path
		else
			@shipping_addresses = Shipping_address.all
			render :index
		end
	end

	def index
		@shipping_addresses = Shipping_address.all
	end

	private

	def shipping_address_params
		params.require(:shipping_address).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :delete_flag)
	end
end
