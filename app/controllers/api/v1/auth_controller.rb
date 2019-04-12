class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      jwt = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: jwt}
    else
      render json: {errors: "Please enter the correct username and password!"}
    end
  end

  def auto_login
    user = current_user
    if user
      render json: user
    else
      render json: {errors: "I don't think so"}
    end
  end
end
