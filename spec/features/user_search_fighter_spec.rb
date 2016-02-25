require 'rails_helper'
 
feature 'User search fighter' do
  
  let(:fighter) { FactoryGirl.create(:fighter) } 
  
  scenario 'with valid data' do
    visit(root_path)
    search_fighter(fighter)
    
    expect(page).to have_content("#{fighter.first_name} #{fighter.last_name}")
  end
  
  scenario 'with invalid data' do
    fighter.first_name = " "
    fighter.last_name = " "
    
    visit(root_path) 
    search_fighter(fighter)
    
    expect(page).to have_content('No fighters found')
  end
end