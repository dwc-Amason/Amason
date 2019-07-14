class ItemsController < ApplicationController

	def index
		@items = Item.all
		@itemse = Item.page(params[:page]).per(15)
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
			render :shwow
		end
  	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
		@disc = @item.discs.build
		@song = @disc.song.build
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


	private
	def item_params
	   	params.require(:item).permit(:name, :price, :status, :stack, :image_id, :artist_id, :genre_id, :label_id, discs_attributes: [:id, :_destroy])
	end
end
