require 'rails_helper'

RSpec.describe "skills/new.html.erb", :type => :view do
  
  before do
    @skill = FactoryGirl.build(:skill) 
    assign :skill, @skill
    assign :fighter, @skill.fighter
    
    render
  end
  
  it 'displays a name of fighter' do
    expect(rendered).to have_content("#{@skill.fighter.first_name} #{@skill.fighter.last_name}")
  end
  
  it 'displays a form to add a new skill to fighter' do
    expect(rendered).to have_tag('form', :with => { :action => "/fighters/#{@skill.fighter.id}/skills", :method => 'post' }) do
      with_tag "input", :with => { :name => "skill[name]", :type => 'text' }
      with_tag "input", :with => { :name => "skill[level]", :type => 'text' }
      with_tag "input", :with => { :value => "Add Skill", :type => 'submit' } 
    end
  end
end
