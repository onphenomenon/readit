class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy, :edit, :update]

  def index
    @topics = Topic.active
  end

  def create
    @topic = Topic.new(topic_params)
    my_save(@topic, topics_path)
  end

  def new
    @topic = Topic.new
  end

  def show
    @posts = @topic.posts.active
    @post = Post.new
  end

  def destroy
    my_destroy(@topic, topics_path)
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
    @topic = Topic.find(params[:id])
  end
end
