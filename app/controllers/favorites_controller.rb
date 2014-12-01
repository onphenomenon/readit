class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.active
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    my_save(@favorite, favorites_path)
  end

  def new
    @favorite = Favorite.new
    @posts = Post.active
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    my_destroy(@favorite, favorites_path)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:post_id)
  end
end
