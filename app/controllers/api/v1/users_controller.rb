class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: jwt}
    else
      render json: { errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end


  def destroy
    userId = @user.id
    @user.destroy
    render json: {message: "user deleted", userId:userId}
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
