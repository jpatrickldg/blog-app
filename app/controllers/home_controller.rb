class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
    @posts = Post.includes(:user).all
  end

  def dashboard
    @posts = current_user.posts
  end
end