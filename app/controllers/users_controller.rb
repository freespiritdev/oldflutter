class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:username)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  def update

    if @user.update(user_params)
      redirect_to users_url
    else
      render :edit
      end
    end

  def show
  end
  
  

private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
