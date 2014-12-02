class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    # respond_to do |format|
    # format.html { redirect_to topic_post_path(@comment.post.topic, @comment.post) }
    # format.js
    # end
    # my_save(@comment, topic_post_path(@comment.post.topic, @comment.post))
    my_save(@comment, topic_post_path(@comment.post.topic, @comment.post), topic_post_path(@comment.post.topic, @comment.post))

  end

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def destroy
    if current_user == @comment.user || current_user == @comment.post.user
      @comment = Comment.find(params[:id])
      my_destroy(@comment, topic_post_path(@comment.topic, @comment.post), topic_post_path(@comment.topic, @comment.post))
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :description)
  end
end
