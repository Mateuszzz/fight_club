require 'rails_helper'

RSpec.describe "fighters/show.html.erb", :type => :view do
  
  describe 'for all fighters' do
    before do
      @fighter = FactoryGirl.create(:fighter)
      assign :fighter, @fighter
    
      render
    end
  
    it 'renders _avatar partial' do
      expect(view).to render_template(:partial => "_avatar")
    end
  
    it 'displays a fighter name' do
      expect(rendered).to have_content("#{@fighter.first_name} #{@fighter.last_name}")
    end
  
    it 'displays an fighter avatar' do
      expect(rendered).to have_tag("img[title='#{@fighter.first_name} #{@fighter.last_name}']")
    end
    
    it 'displays a fighter experience points' do
      expect(rendered).to have_content("#{@fighter.experience_points} point(s)")
    end
  
    it 'displays a fighter description' do
      expect(rendered).to have_content("#{@fighter.description}")
    end
  end
  
  describe 'for active fighter' do
    context 'with 9 skills' do
      it 'does not display a link to add skill' do
        @fighter = FactoryGirl.create(:fighter_with_skills, skills_count: 9)
        assign :fighter, @fighter
    
        render
        
        expect(rendered).to_not have_link("Add skill", new_fighter_skill_path(@fighter))
      end
    end
    
    context 'with less than 9 skills' do
      it 'displays a link to add skill' do
        @fighter = FactoryGirl.create(:fighter_with_skills, skills_count: 2)
        assign :fighter, @fighter
    
        render
        
        expect(rendered).to have_link("Add skill", new_fighter_skill_path(@fighter))
      end
    end
  end
  
  describe 'for inactive fighters' do
    it 'displays a link to add skill' do
      @fighter = FactoryGirl.create(:fighter)
      assign :fighter, @fighter
    
      render
      
      expect(rendered).to have_link("Add skill to active a fighter", new_fighter_skill_path(@fighter))
    end
  end
  
  describe 'for fighters with skills' do
    before do
      @fighter = FactoryGirl.create(:fighter_with_skills, skills_count: 1)
      assign :fighter, @fighter
    
      render
    end
    
    it 'displays a name of skills' do
      expect(rendered).to have_tag("td", text: "#{@fighter.skills.first.name}")
    end
    
    it 'displays a level of skills' do
      expect(rendered).to have_tag("td", text: "#{@fighter.skills.first.level}")
    end
  end
end
