require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", :type => :view do
  
  it "displays a link to create new fighter" do
    render
    
    expect(rendered).to have_link('New Fighter!', href: new_fighter_path)
  end
end
