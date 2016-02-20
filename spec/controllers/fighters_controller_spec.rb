require 'rails_helper'

RSpec.describe FightersController, :type => :controller do

  describe "GET #index" do
    before do
      get :index
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
  
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
  
  describe "Post #create" do
   
    context 'when data is valid' do  
      it "redirect to fighter" do
        post :create, fighter: attributes_for(:fighter, avatar: fixture_file_upload('image.jpg', 'image/jpg'))
      
        expect(response).to redirect_to(fighter_path(assigns[:fighter]))
      end
    end
    
    context 'when data is invalid' do
      before do
         post :create, fighter: attributes_for(:fighter, avatar: "")
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
      
      it "renders the new template" do      
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show/:id" do
    before do
      fighter = FactoryGirl.create(:fighter)
      get :show, id: fighter
    end
      
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the show template" do
      expect(response).to render_template(:show)
    end  
  end
end
