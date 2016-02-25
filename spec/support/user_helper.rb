module  UserHelper
 
  def create_fighter(fighter)
    click_link('New Fighter')
    fill_in('fighter[first_name]', with: fighter.first_name)
    fill_in('fighter[last_name]', with: fighter.last_name)
    fill_in('fighter[description]', with: fighter.description)  
    attach_file('Avatar', "#{Rails.root}/spec/support/fixtures/image.jpg")
    click_button('Create Fighter')
  end
  
  def create_fight(fight)
    click_link('Fight')
    select("#{fight.first_fighter.first_name} #{fight.first_fighter.last_name}", from: 'fight[first_fighter_id]')
    select("#{fight.second_fighter.first_name} #{fight.second_fighter.last_name}", from: 'fight[second_fighter_id]')
    click_button('Fight')
  end
  
  def add_skill_to_fighter(fighter, skill)
    click_link('Add skill')
    fill_in('skill[name]', with: skill.name)
    fill_in('skill[level]', with: skill.level)
    click_button('Add Skill')
  end
  
  def search_fighter(fighter)
    click_link('Fighters')
    fill_in('first_params', with: fighter.first_name)
    fill_in('second_params', with: fighter.last_name)
    click_button('Search')
  end
  
end