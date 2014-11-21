class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @post = Post.new(post_params)
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    if @post.save
      flash[:notice] = 'Post saved'
      redirect_to @post
    else
      flash[:error] = 'Post not created'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.status = :deleted
  	if @post.save
  		flash[:notice] = 'Post saved'
  		redirect_to topic_posts_path
  	else
  		flash[:error] = 'Post delete failed'
  		redirect_to topic_post_path
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  	@topic = Topic.find(params[:topic_id])
  end

  def update
    @post = Post.find(params[:id])
  	@topic = Topic.find(params[:topic_id])

  	if @post.update_attributes(post_params)
  		flash[:notice] = 'Post updated'
  		redirect_to [@topic, @post]
  	else 
  		flash[:notice] = 'Update failed'
  		render :edit
  	end

  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
