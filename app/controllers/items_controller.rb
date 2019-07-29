class ItemsController < ApplicationController

	def index
		@cart_item = CartItem.new
		@items = @q.result.includes(:artist).includes(:genre).page(params[:page]).per(9)
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
	  	if @item.update(item_params)
			redirect_to admins_itemShow_path(@item)
		else
			@item = Item.find(params[:id])
			render :show
		end
  	end

	def show
		@item = Item.find(params[:id])
        @discs = @item.discs
        @cart_item = CartItem.new
	end

	def new
		@item = Item.new
		@disc = @item.discs.build
		@song = @disc.songs.build
		@genres = Genre.all
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to admins_itemIndex_path
		else
			@items = Item.all.page(params[:page]).per(3)
			render :index
		end
	end


	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to  admins_itemIndex_path
		flash[:notice] = "削除されました"
	end


	private
	def item_params
	   	params.require(:item).permit(:id,
	   								 :page,
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

