class FlitsController < ApplicationController
  
  def create
    @flit = current_user.flits.build(flit_params)
    if @flit.save
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
   def flit_params
     params.require(:flit).permit(:message)

    
   end
end
