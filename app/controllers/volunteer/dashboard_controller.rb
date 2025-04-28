class Volunteer::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_volunteer

  def index
    # Volunteer-specific dashboard logic
  end

  private

  def verify_volunteer
    redirect_to organization_dashboard_path unless current_user.role === "volunteer"
  end
end
