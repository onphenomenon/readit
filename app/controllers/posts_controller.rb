class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :check_post_ownership, only: [:destroy, :edit, :update]

  def index
    # @topic = Topic.find(params[:topic_id])
    # @posts = Post.includes(:topic).active.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @topic = Topic.find(params[:topic_id])
    @post.topic_id = params[:topic_id]
    my_save(@post, topic_path(@post.topic))
  end

  def show
    # if params[:topic_id].blank?  # implies /posts/Y, no params[:topic_id]
    # return redirect_to [@post.topic, @post]
    # end

    # implies /topic/X/posts/Y
    @comments = @post.comments.active
    @comment = Comment.new post_id: @post.id
    @score = @post.votes.pluck(:value).compact.sum
  end

  def destroy
    my_destroy(@post, topic_path(@post.topic))
  end

  def edit
    @topic = Topic.find(params[:topic_id])
  end

  def update
    my_update(@post, post_params, topic_post_path(@post.topic, @post))
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def check_post_ownership
    unless @post.user == current_user
      redirect_to new_user_session_path
    end
  end
end
