require 'rails_helper'

RSpec.describe "fighters/index.html.erb", :type => :view do
  before do
    fighter = FactoryGirl.create(:fighter)
    @fighters = Fighter.all.paginate(page: params[:page], per_page: 5)
    assign :fighters, @fighters
    
    render
  end
  
  it 'renders _pagination partial' do
    expect(view).to render_template(:partial => "_pagination")
  end
  
  it 'renders _avatar partial' do
    expect(view).to render_template(:partial => "_avatar")
  end
  
  it 'displays a form to create a new category' do
    expect(rendered).to have_tag('form', :with => { :action => '/fighters', :method => 'get' }) do
      with_tag "input", :with => { :name => "first_params", :type => 'text' }
      with_tag "input", :with => { :name => "second_params", :type => 'text' }
      with_tag "input", :with => { :value => "Search", :type => 'submit' }
    end
  end
  
  it 'displays a link to fighter' do
    expect(rendered).to have_link("#{@fighters.first.first_name} #{@fighters.first.last_name}", href: fighter_path(@fighters.first))
  end
  
  it 'displays an fighter avatar' do
    expect(rendered).to have_tag("img[title='#{@fighters.first.first_name} #{@fighters.first.last_name}']")
  end
end
