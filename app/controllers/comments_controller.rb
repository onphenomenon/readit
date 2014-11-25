class CommentsController < ApplicationController
  def index
    #question here
    #  /posts?topic_id=4

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = 'Comment Saved'
      redirect_to @comment.post
    else
      flash[:error] = "Comment not saved"
      render :new
    end
  end

  def new
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user = current_user
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
