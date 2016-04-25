class Fight < ActiveRecord::Base
  include FightSymulator
  
  belongs_to :first_fighter, class_name: "Fighter"
  belongs_to :second_fighter, class_name: "Fighter"
  belongs_to :winner, class_name: "Fighter"
  
  validates :first_fighter_id, presence: true
  validates :second_fighter_id, presence: true
  validates :winner_id, presence: true
  
  validate :check_first_fighter_id_and_second_fighter_id

  def check_first_fighter_id_and_second_fighter_id  
    if self.first_fighter_id == self.second_fighter_id
      errors.add(:first_fighter_id, "can't equal second fighter")
    end
  end
end
