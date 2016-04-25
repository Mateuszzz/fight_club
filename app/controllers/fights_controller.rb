class FightsController < ApplicationController
  
  def show
    @fight = Fight.find(params[:id])
    @winner = Fighter.find(@fight.winner_id)
  end
  
  def new
    @fight = Fight.new
    @fighters = Fighter.find_active
  end
  
  def create
    @fight = Fight.new(fight_params)
     
    @fighters_points = @fight.check_winner
     
    if @fight.save      
      @fight.first_fighter.update(experience_points: @fighters_points.first)
      @fight.second_fighter.update(experience_points: @fighters_points.second)
      
      flash[:success] = "Fight was successfully created!"
      redirect_to @fight
    else
      @fighters = Fighter.find_active
      render 'new'
    end
  end
  
  private
  
    def fight_params
      params.require(:fight).permit(:first_fighter_id, :second_fighter_id)
    end
end
