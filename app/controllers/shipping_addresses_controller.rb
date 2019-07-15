class ShippingAddressesController < ApplicationController

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_addresses = ShippingAddress.page(params[:page]).per(5)
	end

	def new
		@shipping_address = ShippingAddress.new
	end
    def create
		@shipping_address = ShippingAddress.new(item_params)
		if @shipping_address.save
			redirect_to shipping_address_path(@shipping_address)
		else
			@shipping_address = ShippingAddress.all
			render :index
		end
	end
	def index
		@shipping_addresses = ShippingAddress.all
	end

	private
	def shipping_address_params
	   	params.require(:shipping_address).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :user_id,  :delete_flag)
	end
end
