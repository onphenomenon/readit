class FavoritesController < ApplicationController
	def index
		@favorite = Favorite.all
	end

	def create
		@favorite = Favorite.new(favorite_params)
		if @favorite.save
			fash[:notice] = 'Favorite Saved'
		else
			flash[:error] = 'Favorite not saved'
			render :index
		end
	end

	def new
	end

	def show
	end

	def destroy
	end

	def edit
	end


	private
	def favorite_params
		params.require(:favorite).permit()
	end


end
