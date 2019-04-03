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
    user = User.create(user_params)
    render json: user, status: 201
  end

  def update
    @user.update(user_params)
    render json: @user, status: 200
  end

  def destroy
    userId = @user.id
    @user.destroy
    render json: {message: "user deleted", userId:userId}
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :username, :email, :state, :city, :zipcode)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
