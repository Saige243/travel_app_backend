class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def configure_permitted_parameters
    # Permit the first_name and last_name parameters along with the other sign up parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # Permit the first_name and last_name parameters along with the other account update parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
