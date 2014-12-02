class TopicsController < ApplicationController
  before_action :user_is_admin, only: [:new, :create, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_topic, only: [:show, :destroy, :edit, :update]

  def index
    @topics = Topic.active
  end

  def create
    @topic = Topic.new(topic_params)
    my_save(@topic, topics_path, new_topic_path)
  end

  def new
    @topic = Topic.new
  end

  def show
    @posts = @topic.posts.active
    @post = Post.new
  end

  def destroy
    my_destroy(@topic, topics_path, topic_path)
  end

  def edit
  end

  def update
    if @topic.update_attributes(topic_params)
      flash[:notice] = 'Topic updated'
      redirect_to @topic
    else
      flash[:error] = 'Topic not updated'
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

  def set_topic
    @topic = Topic.where(id: params[:id]).first
    if @topic == nil
      flash[:error] = "Topic does not exist"
      redirect_to topics_path
    end
  end

  def user_is_admin
    unless current_user.is_admin?
      flash[:error] = "Unauthorized User"
      redirect_to topics_path
    end
  end
end
