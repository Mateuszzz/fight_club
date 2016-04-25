module FightSymulator
  extend ActiveSupport::Concern

  def check_winner
    winner_id = 0
    first_fighter_add_point = 0
    second_fighter_add_point = 0
    
    if (!self.first_fighter_id.nil? && !self.second_fighter_id.nil? )
      first_fighter_points = 0;
      second_fighter_points = 0;
        
      first_fighter_add_point = self.first_fighter.experience_points
      second_fighter_add_point = self.second_fighter.experience_points
      
      self.first_fighter.skills.each do |i|
         first_fighter_points +=i.level * rand(1..5)
      end
    
       self.second_fighter.skills.each do |i|
        second_fighter_points +=i.level * rand(1..5)
      end
        
      if self.first_fighter.experience_points > self.second_fighter.experience_points
        first_fighter_points +=4
      elsif self.second_fighter.experience_points > self.second_fighter.experience_points
        second_fighter_points +=4
      end
      
      if first_fighter_points > second_fighter_points
        winner_id = self.first_fighter_id
        first_fighter_add_point += 10 
        second_fighter_add_point += 1
      
      elsif first_fighter_points < second_fighter_points
        winner_id = self.second_fighter_id
        first_fighter_add_point += 1
        second_fighter_add_point += 10
      
      else    
        random = rand(1..2)
        
        if random == 1
          winner_id = self.first_fighter_id
          first_fighter_add_point += 10
          second_fighter_add_point += 1
          
        elsif random == 2
          winner_id = self.second_fighter_id
          first_fighter_add_point += 1
          second_fighter_add_point += 10
        end
      end
    end
    
    self.winner_id = winner_id
    @fighters_points = [first_fighter_add_point, second_fighter_add_point]
    
  end    
end