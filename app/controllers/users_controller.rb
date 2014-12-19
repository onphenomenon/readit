class UsersController < ApplicationController
  before_action :authenticate_user!

  def posts
    @posts = Post.active.where(user_id: current_user)

  end

  def comments
    @comments = Comment.where(user_id: current_user)
  end

end
