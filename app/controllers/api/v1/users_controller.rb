class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user, status:200
  end

  def create
    @user = User.create(user_params)
    render json: @user, status: 201
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    userId = @user.id
    @user.destroy
    render json: {message:"Zap! user deleted", userId:userId}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :picture, :password_digest)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
