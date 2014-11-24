class FavoritesController < ApplicationController
  before_action :authenticate_user!

	def index
		@favorites = current_user.favorites.active
	end

	def create
		@favorite = Favorite.new(favorite_params)
		@favorite.user = current_user
		if @favorite.save
			flash[:notice] = 'Favorite Saved'
			redirect_to @favorite
		else
			flash[:error] = 'Favorite not saved'
			render :new
		end
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
		@favorite.status = :deleted
		if @favorite.save
			flash[:notice] = "favorite deleted"
			redirect_to favorites_path
		else
			flash[:error] = "favorite not deleted"
			redirect_to favorite_path
		end

	end


	private
	def favorite_params
		params.require(:favorite).permit(:post_id)
	end


end
