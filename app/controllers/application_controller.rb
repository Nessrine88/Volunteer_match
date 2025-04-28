class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protected

  def after_inactive_sign_up_path_for(resource)
    # This is the path where users are sent after sign up when using confirmable
    new_user_confirmation_path
    # Or if you want to show a specific page:
    # confirmation_sent_path
  end
end
