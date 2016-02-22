require 'rails_helper'

RSpec.describe SkillsController, :type => :controller do

  let(:skill) { FactoryGirl.build(:skill) }

  describe "GET #new" do
    before do
      get :new, fighter_id: skill.fighter_id
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
        post :create, fighter_id: skill.fighter_id, skill: attributes_for(:skill)
      
        expect(response).to redirect_to(fighter_path(skill.fighter_id))
      end
    end
    
    context 'when data is invalid' do
      before do
         post :create, fighter_id: skill.fighter_id, skill: attributes_for(:skill, name: "")
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
      
      it "renders the new template" do      
        expect(response).to render_template(:new)
      end
    end
  end  
end
