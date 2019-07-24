class AdminsController < ApplicationController
	def userIndex
		@users = User.all
	end

	def userShow
		@user = User.find(params[:id])
	end

	def shipping_address
		@user = User.find(params[:id])
		@shipping_addresses = ShippingAddress.where(user_id: @user)
	end

	def enduser_order
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user)
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
		@disc = Disc.find(@item.id)
		@discs = Disc.where(item_id: @item)
		@songs = Song.where(disc_id: @disc.id)
	end

	def order
		@orders = Order.all
	end

	def orderShow
		@orderitems = Orderitem.all
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

  	private
  	def item_params
	   	params.require(:item).permit(:id,
	   								 :name,
	   								 :price,
	   								 :status,
	   								 :stack,
	   								 :image,
	   								 :artist_id,
	   								 :genre_id,
	   								 :label_id,
	   								 discs_attributes: [:id,
	   								 	                :name,
	   								 	                :item_id,
	   								 	                :_destroy,
	   	                             					songs_attributes: [:id,
	   	                             						               :name,
	   	                             						               :track,
	   	                             						               :disc_id,
	   	                             						               :_destroy]])
	end
end
