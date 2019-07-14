class ArtistsController < ApplicationController

  def create
  	@artist = Artist.new(artist_params)
  	@artist.save
  end

  def index
  	@artists = Artist.all
  	@artist = Artist.new
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
  	@artist.update
  end

  private
  def artist_params
	params.require(:artist).permit(:name)
  end
end
