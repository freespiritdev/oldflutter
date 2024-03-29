class UsersController < ApplicationController
   #before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
   before_action :admin_user,     only: :destroy

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
      flash[:notice] = "Thanks for joining!"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to users_url
    else
      render :edit
      end
    end

  def show
      @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  

private
=begin def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      store_location
      redirect_to users_url
    end
  end
=end
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
