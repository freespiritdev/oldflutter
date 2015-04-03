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
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
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
     @user = current_user
  end
  
  

private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
