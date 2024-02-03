# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      sign_in(resource_name, resource)
      render json: { success: true, user: resource_data(resource) }, status: :ok
    else
      render json: { success: false, errors: ["Invalid email or password."] }, status: :unauthorized
    end
  rescue StandardError => e
    render json: { success: false, errors: [e.message] }, status: :unprocessable_entity
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
