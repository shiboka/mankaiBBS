class AuthController < ApplicationController
  def login
    @user = User.find_by_username(params[:username])

    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: }, status: :ok
    else
      render json: { message: "Unauthorized" }, status: :unauthorized
    end
  end
end
