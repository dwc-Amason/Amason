class AdminsController < ApplicationController
	def userIndex
		@users = User.all.page(params[:page]).per(9)
		@t = User.ransack(params[:t], search_key: :t)
        @users = @t.result.page(params[:page]).per(9)
	end

	def userShow
		@user = User.find(params[:id])
	end

	def shipping_address
		@user = User.find(params[:id])
		@shipping_addresses = ShippingAddress.where(user_id: @user).page(params[:page]).per(3)
	end

	def enduser_order
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user).page(params[:page]).per(3)
	end

	def itemIndex
		@items = Item.all.page(params[:page]).per(9)
	end

	def itemShow
		@item = Item.find(params[:id])
		@discs = @item.discs
	end

	def itemEdit
		@item = Item.find(params[:id])
		@disc = Disc.find(@item.id)
		@discs = Disc.where(item_id: @item)
		@songs = Song.where(disc_id: @disc)
	end

	def order
		@orders = Order.all.page(params[:page]).per(3)
	end

	def orderShow
		@orderitems = Orderitem.all.page(params[:page]).per(3)
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


  	def search
  		@users = User.search(params[:search]).page(params[:page]).per(15)
  		@items = Item.search(params[:search])
		@cart_item = CartItem.new
		render :index
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
