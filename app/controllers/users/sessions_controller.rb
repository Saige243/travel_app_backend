# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def jwt_for(resource)
    payload = { user_id: resource.id, email: resource.email }
    # Adjust the below to use your JWT secret and expiration logic
    JWT.encode(payload, ENV['JWT_SECRET_KEY'], 'HS256')
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      sign_in(resource_name, resource)
      token = jwt_for(resource) # Generate a JWT for the signed-in user
      render json: { success: true, jwt: token, user: resource_data(resource) }, status: :ok
    else
      # It's more accurate to handle this case directly, as `warden.authenticate` will throw if auth fails
      render json: { success: false, errors: ["Invalid email or password."] }, status: :unauthorized
    end
  rescue Warden::WardenError => e
    # Handle specific Warden/Devise authentication errors
    render json: { success: false, errors: [e.message] }, status: :unauthorized
  rescue => e
    # Log or report the error to your error monitoring system
    Rails.logger.error("Sign in error: #{e.class}: #{e.message}")
    # Consider rendering a generic error message here
    render json: { success: false, errors: ["An unexpected error occurred."] }, status: :internal_server_error
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def resource_data(resource)
    {
      id: resource.id,
      email: resource.email
    }
  end
end
