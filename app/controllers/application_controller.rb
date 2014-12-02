class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_topics

  private

  def set_topics
    @topics = Topic.active
  end

  def my_destroy(object, success_redirect, error_redirect)
    object.status = :deleted
    if object.save
      flash[:notice] = "#{object.class} deleted"
      redirect_to success_redirect
    else
      flash[:error] = "#{object.class} delete failed"
      redirect_to error_redirect
    end
  end

  def my_save(object, success_redirect, error_redirect)
    if object.save
      flash[:notice] = "#{object.class} saved"
      redirect_to success_redirect
    else
      flash[:error] = "#{object.class} not saved"
      redirect_to error_redirect
    end
  end
end
