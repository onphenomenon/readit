class TopicsController < ApplicationController
	def index
		@topic = Topic.active
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
		@topic = Topic.find(params[:id])
	end
	def destroy
		@topic = Topic.find(params[:id])
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
		@topic = Topic.find(params[:id])
	end
	def update
		@topic = Topic.find(params[:id])

		if @topic.update_attributes(topic_params)
			flash[:notice]= 'Topis updated'
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

end