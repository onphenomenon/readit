class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(comment_params)
    @comment.user = current_user
    # respond_to do |format|
    # format.html { redirect_to topic_post_path(@comment.post.topic, @comment.post) }
    # format.js
    # end

    # my_save(@comment, topic_post_path(@comment.post.topic, @comment.post))
    redirect_to topic_post_path(@comment.post.topic, @comment.post)
  end

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
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
