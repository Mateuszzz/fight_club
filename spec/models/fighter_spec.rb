require 'rails_helper'

RSpec.describe Fighter, :type => :model do
  
  describe "Instance methods" do  
    it "default values" do
      fighter =  FactoryGirl.create(:fighter) 
      
      expect(fighter.experience_points).to be_equal(0)
    end
  end
  
  describe "Validations" do
    let(:fighter) { FactoryGirl.build(:fighter) }
    
    it "is valid with correct data" do
      expect(fighter).to be_valid
    end
    
    it "is invalid without a first name" do
      fighter.first_name = nil
      expect(fighter).not_to be_valid
    end
    
    it "is invalid with too long first name" do
      fighter.first_name = "a" * 51
      expect(fighter).not_to be_valid
    end
    
    it "is invalid without a last name" do
      fighter.last_name = nil
      expect(fighter).not_to be_valid
    end
    
    it "is invalid with too long last name" do
      fighter.last_name = "a" * 51
      expect(fighter).not_to be_valid
    end
    
    it "is invalid without a description" do
      fighter.description = nil
      expect(fighter).not_to be_valid
    end
    
    it "is invalid with too short description" do
      fighter.description = "a" * 14
      expect(fighter).not_to be_valid
    end
    
    it "is invalid with too long description" do
      fighter.description = "a" * 1001
      expect(fighter).not_to be_valid
    end
    
    it "is invalid without a avatar" do
      fighter.avatar = nil
      expect(fighter).not_to be_valid
    end
    
    it "is invalid with duplication combination of first name and last name" do
      second_fighter = FactoryGirl.create(:fighter, first_name: fighter.first_name, last_name: fighter.last_name)
      
      expect(fighter).not_to be_valid
    end
  end
end
