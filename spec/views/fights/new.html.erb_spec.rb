require 'rails_helper'

RSpec.describe "fights/new.html.erb", :type => :view do
  
  it 'displays a form to create a new category' do
    fight = FactoryGirl.build(:fight)
    fighters = Fighter.find_active

    assign :fight, fight
    assign :fighters, fighters
    
    render
    
    expect(rendered).to have_tag('form', :with => { :action => '/fights', :method => 'post' }) do
      with_tag "select", :with => { :name => "fight[first_fighter_id]" }
      with_tag "select", :with => { :name => "fight[second_fighter_id]" }
      with_tag "input", :with => { :value => "Fight", :type => 'submit' }
    end
  end
end
