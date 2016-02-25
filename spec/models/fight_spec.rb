require 'rails_helper'

RSpec.describe Fight, :type => :model do
  
   describe "Validations" do
    let(:fight) { FactoryGirl.build(:fight) }
    
    it "is valid with correct data" do
      expect(fight).to be_valid
    end
    
    it "is invalid without a first fighter id" do
      fight.first_fighter_id = nil
      
      expect(fight).not_to be_valid
    end
    
    it "is invalid without a second fighter id" do
      fight.second_fighter_id = nil
      
      expect(fight).not_to be_valid
    end
    
    it "is invalid without a winner id" do
      fight.winner_id = nil
      
      expect(fight).not_to be_valid
    end
    
    it "is invalid with equal first fighter id and second fighter id" do
      fight.first_fighter_id = fight.second_fighter_id
      
      expect(fight).not_to be_valid
    end
  end
end
