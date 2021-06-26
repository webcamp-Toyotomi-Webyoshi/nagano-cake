class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def authenticate
    redirect_to admin_seesion_path unless admin_signed_in?
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def set_genre
    @genre = Genre.where(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
