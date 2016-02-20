require 'rails_helper'

RSpec.describe "fighters/new.html.erb", :type => :view do
  
  before do
    fighter = FactoryGirl.build(:fighter) 
    assign :fighter, fighter
    
    render
  end
  
  it "renders _form partial" do
    expect(view).to render_template(:partial => "_form")
  end
  
  it 'displays a form to create a new category' do
    expect(rendered).to have_tag('form', :with => { :action => '/fighters', :method => 'post' }) do
      with_tag "input", :with => { :name => "fighter[first_name]", :type => 'text' }
      with_tag "input", :with => { :name => "fighter[last_name]", :type => 'text' }
      with_tag "textarea", :with => { :name => "fighter[description]" }
      with_tag "input", :with => { :name => "fighter[avatar]", :type => 'file' }
      with_tag "input", :with => { :value => "Create Fighter", :type => 'submit' }
    end
  end
end
