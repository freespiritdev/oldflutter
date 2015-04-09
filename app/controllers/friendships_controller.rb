class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "You are now friends."
      redirect_to root_url
    else
      flash[:error] = "Oops something isn't right, try again"
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])

    @friendship.destroy
    flash[:notice] = "Successfully unfriended."
    redirect_to root_url
  end
end