class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
    @posts = Post.includes(:user).all
  end

  def dashboard
    id = current_user.id
    @current_user_posts = current_user.posts
    @posts = Post.where.not(user_id: id)
  end
end