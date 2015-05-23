class Admin::DashboardsController < ApplicationController
  before_action :require_admin

  layout 'admin'

  # GET admin/dashboards
  def index
  end

  private

  def require_admin
    redirect_to root_path unless current_user.try(:admin?)
  end
end
