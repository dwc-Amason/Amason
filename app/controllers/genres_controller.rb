class GenresController < ApplicationController

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
    redirect_to genres_path
  end

  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
  	@genre.update
    redirect_to genres_path
  end

  private
  def genre_params
	params.require(:genre).permit(:name)
  end
end
