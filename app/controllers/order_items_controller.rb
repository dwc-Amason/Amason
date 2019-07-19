class OrderItemsController < ApplicationController

	def show
	    @orderitems = Orderitem.page(params[:page]).per(5)
	end
end
