class ArtistsController < ApplicationController

  def create
  	@artist = Artist.new(artist_params)
  	@artist.save
    redirect_to artists_path
  end

  def index
  	@artists = Artist.all
  	@artist = Artist.new
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
  	@artist.update(artist_params)
    redirect_to artists_path
  end

  private
  def artist_params
	params.require(:artist).permit(:name)
  end
end
