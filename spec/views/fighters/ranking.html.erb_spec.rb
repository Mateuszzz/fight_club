require 'rails_helper'

RSpec.describe "fighters/ranking.html.erb", :type => :view do
  before do
    fighter = FactoryGirl.create(:fighter)
    @per_page = 5
    @rank = 1
    @fighters = Fighter.order(experience_points: :desc, created_at: :asc).paginate(page: params[:page], per_page: @per_page)
    
    assign :per_page, @per_page
    assign :rank, @rank
    assign :fighters, @fighters
    
    render
  end
  
  it 'renders _pagination partial' do
    expect(view).to render_template(:partial => "_pagination")
  end
  
  it 'renders _avatar partial' do
    expect(view).to render_template(:partial => "_avatar")
  end
  
  it 'displays a link to fighter' do
    expect(rendered).to have_link("#{@fighters.first.first_name} #{@fighters.first.last_name}", href: fighter_path(@fighters.first))
  end
  
  it 'displays an fighter avatar' do
    expect(rendered).to have_tag("img[title='#{@fighters.first.first_name} #{@fighters.first.last_name}']")
  end
  
  it 'displays a fighter experience points' do
    expect(rendered).to have_content("#{@fighters.first.experience_points} point(s)")
  end
end
