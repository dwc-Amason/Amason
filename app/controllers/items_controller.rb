class ItemsController < ApplicationController

	def index
		@items = Item.all
		@itemse = Item.page(params[:page]).per(15)
		@cart_item = CartItem.new
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
	  	if @item.update(item_params)
			redirect_to item_path(@item)
		else
			@item = Item.find(params[:id])
			render :show
		end
  	end

	def show
		@item = Item.find(params[:id])
        @discs = @item.discs
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
			redirect_to items_path
		else
			@items = Item.all
			render :index
		end
	end

	def search
		@items = Item.search(params[:search])
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end


	private
	def item_params
	   	params.require(:item).permit(:id,
	   								 :name,
	   								 :price,
	   								 :status,
	   								 :stack,
	   								 :image_id,
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
