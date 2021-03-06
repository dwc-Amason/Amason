class ShippingAddressesController < ApplicationController

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def new
		@shipping_address = ShippingAddress.new
	end

    def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.user_id = current_user.id
		if @shipping_address.save
			redirect_to user_path(current_user.id)
		else
			render :new
		end
	end

	def index
		@shipping_addresses = ShippingAddress.where(user_id: current_user.id)
	end
	def set_address
		redirect_to cart_items_path

	end

	def update
    @shipping_address = ShippingAddress.find(params[:id])
  	@shipping_address.update(shipping_address_params)
    redirect_to user_shipping_addresses_path
  end

	private
	def shipping_address_params
	   	params.require(:shipping_address).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :user_id,  :delete_flag)
	end
end
