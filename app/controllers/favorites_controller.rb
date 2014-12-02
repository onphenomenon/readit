class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.active
  end

  def create
    @post = Post.find(params[:favorite][:post_id])
    @favorite = Favorite.new user: current_user, post: @post
    @favorite.save
    flash[:notice] = 'Post added to Favorites'
    redirect_to topic_post_path(@post.topic, @post)
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
