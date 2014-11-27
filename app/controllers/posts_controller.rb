class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :check_post_ownership, only: [:destroy, :edit, :update]

  def index
    @posts = Post.includes(:topic).active.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic_id = params[:topic_id]
    @topic = Topic.find(params[:topic_id])
    if @post.save
      flash[:notice] = 'Post saved'
      redirect_to @topic
    else
      flash[:error] = 'Post not created'
      render :new
    end
  end

  def show
    #if params[:topic_id].blank?  # implies /posts/Y, no params[:topic_id]
     # return redirect_to [@post.topic, @post]
    #end

    # implies /topic/X/posts/Y
    @comments = @post.comments.active
    @comment = Comment.new post_id: @post.id
    @score = @post.votes.pluck(:value).compact.sum

  end

  def destroy
    @post.status = :deleted
    @topic = Topic.find(params[:topic_id])
    if @post.save
      flash[:notice] = 'Post saved'
  		redirect_to topic_posts_path
  	else
  		flash[:error] = 'Post delete failed'
  		redirect_to topic_post_path
  	end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
  end

  def update

  	if @post.update_attributes(post_params)
  		flash[:notice] = 'Post updated'
  		redirect_to [@topic, @post]
  	else
  		flash[:notice] = 'Update failed'
  		render :edit
  	end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :description)
  end

  def check_post_ownership
    unless @post.user == current_user
      redirect_to new_user_session_path
    end
  end
end
