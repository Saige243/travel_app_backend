class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    render json: @user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render json: { message: "User successfully updated.", user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # Ensure you permit only the parameters you want to be updatable
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
