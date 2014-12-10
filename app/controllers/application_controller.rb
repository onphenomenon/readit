class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_topics

  private

  def set_topics
    @menu_topics = Topic.active.limit(7)

  end

  def my_destroy(object, success_redirect)
    object.status = :deleted
    if object.save
      flash[:notice] = "#{object.class} deleted"
      redirect_to success_redirect
    else
      flash[:error] = "#{object.class} delete failed"
      render :show
    end
  end

  def my_save(object, success_redirect)
    if object.save
      flash[:notice] = "#{object.class} saved"
      redirect_to success_redirect if success_redirect
    else
      flash[:error] = "#{object.class} not saved"
      render :new
    end
  end

  def my_update(object, object_params, success_redirect)
    if object.update_attributes(object_params)
      flash[:notice] = "#{object.class} updated"
      redirect_to success_redirect
    else
      flash[:error] = "#{object.class} not updated"
      render :edit
    end
  end
end
