class ShippingAddressesController < ApplicationController

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_addresses = ShippingAddress.page(params[:page]).per(5)
	end

	def new
		@shipping_address = ShippingAddress.new
	end

    def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.user_id = current_user.id
		if @shipping_address.save
			redirect_to shipping_addresses_path
		else
			@shipping_address = ShippingAddress.all
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
    redirect_to shipping_addresses_path
  end

	private
	def shipping_address_params
	   	params.require(:shipping_address).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :user_id,  :delete_flag)
	end
end
