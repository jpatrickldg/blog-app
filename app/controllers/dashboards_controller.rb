class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.author?
      render "dashboards/author"
    elsif current_user.admin?
      render "dashboards/admin"
    end
  end
end
