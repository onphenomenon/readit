class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :params_exist, only: [:create]

  def index
    @favorites = current_user.favorites.active
  end

  def create
    @post = Post.find(favorite_params[:post_id])
    @favorite = Favorite.new user: current_user, post: @post
    my_save(@favorite, favorites_path)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    my_destroy(@favorite, favorites_path)
  end

  private

  def params_exist
    # binding.pry
    redirect_to topics_path if params.nil? || params[:favorite].nil?
  end

  def favorite_params
    params.require(:favorite).permit(:post_id)
  end
end
