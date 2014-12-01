class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    my_save(@comment, topic_post_path(@comment.topic, @comment.post))
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    my_destroy(@comment, topic_post_path(@comment.topic, @comment.post))
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :description)
  end
end
