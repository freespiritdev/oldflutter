class FriendshipsController < ApplicationController
  def create
    @friendship = friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Error occurred, try adding friend again"
      redirect_to root_url
    end
  end

  def destroy
    @friendship = friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully unfriended."
    redirect_to root_url
  end
end
