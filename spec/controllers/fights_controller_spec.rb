require 'rails_helper'

RSpec.describe FightsController, :type => :controller do

  describe "GET #new" do
    before do
      get :new
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end
  
  describe "GET #show/:id" do
    before do
      fight = FactoryGirl.create(:fight)
      get :show, id: fight
    end
      
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the show template" do
      expect(response).to render_template(:show)
    end  
  end
end
