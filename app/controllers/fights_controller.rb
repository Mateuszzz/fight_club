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
    @winner_id = 0
    @first_fighter_add_point = 0
    @second_fighter_add_point = 0
     
    create_fight
    @fight.winner_id = @winner_id
     
    if @fight.save
        
      @fight.first_fighter.update(experience_points: @first_fighter_add_point)
      @fight.second_fighter.update(experience_points: @second_fighter_add_point)
      
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
    
    def create_fight  
      if (!@fight.first_fighter_id.nil? && !@fight.second_fighter_id.nil? )
        
        @first_fighter_points = 0;
        @second_fighter_points = 0;
        
        @first_fighter_add_point = @fight.first_fighter.experience_points
        @second_fighter_add_point = @fight.second_fighter.experience_points
      
        @fight.first_fighter.skills.each do |i|
          @first_fighter_points +=i.level * rand(1..5)
        end
    
        @fight.second_fighter.skills.each do |i|
          @second_fighter_points +=i.level * rand(1..5)
        end
        
        if @fight.first_fighter.experience_points > @fight.second_fighter.experience_points
          @first_fighter_points +=4
        elsif @fight.second_fighter.experience_points > @fight.second_fighter.experience_points
          @second_fighter_points +=4
        end
      
        if @first_fighter_points > @second_fighter_points
          @winner_id = @fight.first_fighter_id
          @first_fighter_add_point += 10 
          @second_fighter_add_point += 1
      
        elsif @first_fighter_points < @second_fighter_points
          @winner_id = @fight.second_fighter_id
          @first_fighter_add_point += 1
          @second_fighter_add_point += 10
      
        else    
          @random = rand(1..2)
        
          if @random == 1
            @winner_id = @fight.first_fighter_id
            @first_fighter_add_point += 10
            @second_fighter_add_point += 1
          
          elsif @random == 2
            @winner_id = @fight.second_fighter_id
            @first_fighter_add_point += 1
            @second_fighter_add_point += 10
          end     
        end       
      end
    end
end
