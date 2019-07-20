class AdminsController < ApplicationController
	def userIndex
		@users = User.all
	end

	def userShow
		@user = User.find(params[:id])
		@shipping_addresses = ShippingAddress.all
		@orders = Order.all
	end

	def itemShow
	end

	def order
	end

	def orderShow
	end

	def link
  	end

  	def itemview
  		@item = Item.find(params[:id])
        @discs = @item.discs
  	end
end
