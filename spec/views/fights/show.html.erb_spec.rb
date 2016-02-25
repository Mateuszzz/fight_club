require 'rails_helper'

RSpec.describe "fights/show.html.erb", :type => :view do
  
  before do
    @fight = FactoryGirl.create(:fight)
    @winner = Fighter.find(@fight.winner_id)
    assign :fight, @fight
    
    render
  end

  it 'renders _avatar partial' do
    expect(view).to render_template(:partial => "_avatar")
  end

  it "displays a link to first fighter" do
    expect(rendered).to have_link("#{@fight.first_fighter.first_name} #{@fight.first_fighter.last_name}", href: fighter_path(@fight.first_fighter))
  end
  
  it "displays a link to second fighter" do
    expect(rendered).to have_link("#{@fight.first_fighter.first_name} #{@fight.first_fighter.last_name}", href: fighter_path(@fight.first_fighter))
  end
  
  it "displays an avatar first fighter" do
    expect(rendered).to have_tag("img[title='#{@fight.first_fighter.first_name} #{@fight.first_fighter.last_name}']")
  end
  
   it "displays an avatar second fighter" do
    expect(rendered).to have_tag("img[title='#{@fight.second_fighter.first_name} #{@fight.second_fighter.last_name}']")
  end
end
