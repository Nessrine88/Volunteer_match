class Organization::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_organization

  def index
  end

  private

  def verify_organization
    redirect_to volunteer_dashboard_path unless current_user.role === "organization"
  end
end
