class VotesController < ApplicationController

  def create
    @post = Post.find(params[:vote][:post_id])
    @vote = Vote.new user: current_user, post: @post

    if params[:vote][:upordown] == 'up'
      @vote.value = 1
    elsif params[:vote][:upordown] == 'down'
      @vote.value = -1
    end

    @vote.save

    redirect_to @post
  end

  private
   def vote_params
    params.require(:vote).permit(:post_id)
  end

end
