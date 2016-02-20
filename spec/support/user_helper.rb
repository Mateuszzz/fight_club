module  UserHelper
 
  def create_fighter(fighter)
    visit new_fighter_path
    fill_in 'fighter[first_name]', with: fighter.first_name
    fill_in 'fighter[last_name]', with: fighter.last_name
    fill_in 'fighter[description]', with: fighter.description  
    attach_file('Avatar', "#{Rails.root}/spec/support/fixtures/image.jpg")
    click_button 'Create Fighter'
  end
  
end