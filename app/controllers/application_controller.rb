class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protected
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role, :first_name, :last_name, :phone ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :phone ])
  end

  def after_sign_in_path_for(role)
    if current_user.role == "organization"
      organization_dashboard_path
    else
      volunteer_dashboard_path
    end
  end
end
