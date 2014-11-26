class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy, :edit, :update]

  def index
    @topics = Topic.active
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = 'Topic saved'
      redirect_to @topic
    else
      flash[:error] = 'Topic not created'
      render :new
    end
  end

  def new
    @topic = Topic.new
  end

  def show
    @posts = @topic.posts.active
    @post = Post.new
  end

  def destroy
    @topic.status = :deleted
    if @topic.save
      flash[:notice] = 'Topic deleted'
      redirect_to topics_path
    else
      flash[:error] = 'Topic delete failed'
      render :show
    end
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
