require 'rails_helper'

RSpec.describe SkillsController, :type => :controller do

  let(:skill) { FactoryGirl.build(:skill) }

  describe "GET #new" do
    context "when fighter can add new skill" do
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
    
    context "when fighter can not add new skill" do
      it "redirect to fighter" do
        fighter = FactoryGirl.create(:fighter_with_skills, skills_count: 9)
        get :new, fighter_id: fighter.id
      
        expect(response).to redirect_to(fighter)
      end  
    end
  end
  
  describe "Post #create" do 
    context "when data is valid" do  
      it "redirect to fighter" do
        post :create, fighter_id: skill.fighter_id, skill: attributes_for(:skill)
      
        expect(response).to redirect_to(fighter_path(skill.fighter_id))
      end
    end
    
    context "when data is invalid" do
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
