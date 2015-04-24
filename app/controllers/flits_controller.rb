class FlitsController < ApplicationController
  before_action :set_flit, only: [:show,:edit, :update, :destroy]
  
  def create
    flit = Flit.new(flit_params) #current_user.flits.build(flit_params)
    if flit.save!
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @flit.destroy
    redirect_to root_url
  end

  private
    def set_flit
      @flit = Flit.find(params[:id])
    end

    def flit_params
      params.require(:flit).permit(:message)
    end
end
