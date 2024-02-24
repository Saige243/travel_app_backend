class AuthenticationController < ApplicationController
  def logged_in
    if user_signed_in?
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false}
    end
  end

  private

  def current_user_data
    {
      id: current_user.id,
      email: current_user.email,
    }
  end
end
