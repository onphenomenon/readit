class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment Saved'
      redirect_to @comment.post
    else
      flash[:error] = "Comment not saved"
      render :new
    end
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.status = :deleted
    if @comment.save
      flash[:notice] = 'Comment Deleted'
      redirect_to @comment.post
    else
      flash[:error] = "Comment not deleted"
      redirect_to @comment.post
    end
  end

private

def comment_params
  params.require(:comment).permit(:post_id, :description)
end

end
