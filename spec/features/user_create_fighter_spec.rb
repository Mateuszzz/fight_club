require 'rails_helper'
 
feature 'User create fighter' do
  
  scenario 'with valid data' do
    fighter = FactoryGirl.build(:fighter)
    
    visit(root_path)
    create_fighter(fighter)
    
    expect(page).to have_content "Fighter was successfully created!"
  end
  
  scenario 'with invalid data' do
    fighter = FactoryGirl.build(:fighter, first_name: "", last_name: "", description: "")
    
    visit(root_path)
    create_fighter(fighter)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end