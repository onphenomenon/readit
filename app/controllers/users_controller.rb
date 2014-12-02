class UsersController < ApplicationController
  before_action :authenticate_user!

  def posts
    @posts = Post.where(user_id: current_user)
  end

  def comments
    @comments = Comment.where(user_id: current_user)
  end

end
