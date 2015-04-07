class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.user_id
      flash[:notice] = "You Successfully Logged in "
      redirect_to root_url
    else
      flash.now[:error] = "Something went wrong!"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out, Goodbye!"
    redirect_to root_url
  end
end
