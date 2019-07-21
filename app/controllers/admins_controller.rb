class AdminsController < ApplicationController
	def userIndex
		@users = User.all
	end

	def userShow
		@user = User.find(params[:id])
	end

	def shipping_address
	end

	def enduser_order
	end

	def itemIndex
		@items = Item.all
	end

	def itemShow
		@item = Item.find(params[:id])
		@discs = @item.discs
	end

	def itemEdit
		@item = Item.find(params[:id])
		@discs = @item.discs
		@disc = @item.discs.build
		@song = @disc.songs.build
	end

	def order
		@orders = Order.all
	end

	def orderShow
	end

	def link
  	end

  	def update
		@item = Item.find(params[:id])
	  	if @item.update(item_params)
			redirect_to admins_itemShow_path(@item)
		else
			@item = Item.find(params[:id])
			render :itemEdit
		end
  	end

  	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to  admins_itemIndex_path
		flash[:notice] = "削除されました"
	end

  	def itemview
  		@item = Item.find(params[:id])
        @discs = @item.discs
  	end
end
