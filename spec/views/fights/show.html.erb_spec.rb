require 'rails_helper'

RSpec.describe "fights/show.html.erb", :type => :view do
  
  before do
    @fight = FactoryGirl.create(:fight)
    @winner = Fighter.find(@fight.winner_id)
    assign :fight, @fight
    
    render
  end

  it "displays a link to first fighter" do
    expect(rendered).to have_link("#{@fight.first_fighter.first_name} #{@fight.first_fighter.last_name}", href: fighter_path(@fight.first_fighter))
  end
  
  it "displays a link to second fighter" do
    expect(rendered).to have_link("#{@fight.first_fighter.first_name} #{@fight.first_fighter.last_name}", href: fighter_path(@fight.first_fighter))
  end
end
