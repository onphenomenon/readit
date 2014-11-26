class VotesController < ApplicationController

  def create
    @vote = Vote.new(votes)
    @post = Post.find(params[:post_id])
    @vote.user = current_user
    @vote.post = @post
  end
  def new
    @vote = Vote.new(vote_params)
  end

  def destroy #downvote??
  end

  private
   def vote_params
    params.require(:vote).permit(:post_id)
  end

end
