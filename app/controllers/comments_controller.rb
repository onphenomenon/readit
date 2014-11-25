class CommentsController < ApplicationController
  def index
    #question here
    @comments = current_user.comments.active
    @post = Post.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

  if @comment.save
    flash[:notice] = 'Comment Saved'
    redirect_to @post
  else
    flash[:error] = "Comment not saved"
    render :new
  end

  def new
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @post = Post.find(params[:id])
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.status = :deleted
    if @comment.save
      flash[:notice] = "Comment Deleted"
      redirect_to @post
    else
      flash[:error] = "Comment not deleted"
      redirect_to comment_path
    end
  end

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update

  end

private

def comment_params
  params.require(:comment).permit(:post_id, :description)
end

end
