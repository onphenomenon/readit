class VotesController < ApplicationController
  before_action :get_post
  before_action :authenticate_user!

  def up
    save_vote(1)
  end

  def down
    save_vote(-1)
  end

  private

  def save_vote(user_value)
    @vote = Vote.new(post: @post) # mass assignment
    @vote.value = user_value
    @vote.user = current_user
    my_save(@vote, topic_post_path(@post.topic, @post))
  end

  def get_post
    @post = Post.find(vote_params[:post_id])
  end

  def vote_params
    params.require(:vote).permit(:post_id)
  end
end
