module  UserHelper
 
  def create_fighter(fighter)
    visit new_fighter_path
    fill_in 'fighter[first_name]', with: fighter.first_name
    fill_in 'fighter[last_name]', with: fighter.last_name
    fill_in 'fighter[description]', with: fighter.description  
    attach_file 'Avatar', "#{Rails.root}/spec/support/fixtures/image.jpg"
    click_button 'Create Fighter'
  end
  
  def create_fight(fight)
    visit root_path
    click_link 'Fight'
    select "#{fight.first_fighter.first_name} #{fight.first_fighter.last_name}", from: 'fight[first_fighter_id]'
    select "#{fight.second_fighter.first_name} #{fight.second_fighter.last_name}", from: 'fight[second_fighter_id]'
    click_button 'Fight'
  end
  
  def add_skill_to_fighter(fighter, skill)
    visit fighter_path(fighter)
    click_link 'Add skill'
    fill_in 'skill[name]', with: skill.name
    fill_in 'skill[level]', with: skill.level
    click_button 'Add Skill'
  end
  
end