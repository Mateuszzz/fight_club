class FightersController < ApplicationController
  
  def index
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
    @fighter = Fighter.new
  end
  
  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      flash[:success] = "Fighter was successfully created!"
      redirect_to @fighter
    else
      render 'new'      
    end
  end
  
  private
  
    def fighter_params
      params.require(:fighter).permit(:first_name, :last_name, :description, :avatar)
    end
end
