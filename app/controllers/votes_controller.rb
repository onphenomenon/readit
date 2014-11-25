class VotesController < ApplicationController
  def index
  end
  def create
    @vote = Vote.new(votes)
    @post = Post.find(params[:post_id])
    @vote.user = current_user
    @vote.post = @post
  end
  def new
    @vote = Vote.new(vote_params)
  end
  def show

  end
  def destroy #downvote??
  end





  private
   def vote_params
    params.require(:vote).permit(:post_id)
  end

end
