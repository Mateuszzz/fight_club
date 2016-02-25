require 'rails_helper'
 
feature 'User create fight between fighters' do
  
  let(:fight) {FactoryGirl.build(:fight)}
  
  scenario 'with valid data' do
    visit(root_path)
    create_fight(fight)
    
    expect(page).to have_content "Fight was successfully created!"
  end
  
  scenario 'with invalid data' do
    fight.second_fighter_id = fight.first_fighter_id
    
    visit(root_path)
    create_fight(fight)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end