require 'rails_helper'
 
feature 'User add skill to fighter' do
  
  let(:fighter) { FactoryGirl.create(:fighter) }
  
  scenario 'with valid data' do
    skill = FactoryGirl.build(:skill) 
    add_skill_to_fighter(fighter, skill)
    
    expect(page).to have_content "Skill was successfully added!"
  end
  
  scenario 'with invalid data' do
    skill = FactoryGirl.build(:skill, name: "") 
    add_skill_to_fighter(fighter, skill)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end