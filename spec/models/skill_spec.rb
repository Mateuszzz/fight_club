require 'rails_helper'

RSpec.describe Skill, :type => :model do
  
  describe "Validations" do
    let(:skill) { FactoryGirl.build(:skill) }
    
    it "is valid with correct data" do
      expect(skill).to be_valid
    end
    
    it "is invalid without a fighter id" do
      skill.fighter_id = nil
      expect(skill).not_to be_valid
    end
    
    it "is invalid without a name" do
      skill.name = nil
      expect(skill).not_to be_valid
    end
    
    it "is invalid with too short name" do
      skill.name = "a"
      expect(skill).not_to be_valid
    end
    
    it "is invalid with too long name" do
      skill.name = "a" * 36
      expect(skill).not_to be_valid
    end
    
    it "is invalid without a level" do
      skill.level = nil
      
      expect(skill).not_to be_valid
    end
    
    it "is invalid with wrong value of level" do
      skill.level = 6
      expect(skill).not_to be_valid
    end
    
    it "is invalid with duplication combination of fighter and name" do
      second_skill = FactoryGirl.create(:skill, fighter_id: skill.fighter_id)
      
      expect(skill).not_to be_valid
    end
  end  
end
