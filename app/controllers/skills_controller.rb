class SkillsController < ApplicationController
  before_action :check_skills, only: [:new, :create] 
  
  def new 
    @skill = @fighter.skills.build
  end
  
  def create
    @skill = @fighter.skills.build(skill_params)

    if @skill.save
      flash[:success] = "Skill was successfully added!"
      redirect_to @fighter
    else
      render 'new'      
    end
  end
  
  private
  
    def skill_params
      params.require(:skill).permit(:name, :level)
    end
    
    def check_skills
      @fighter = Fighter.find(params[:fighter_id])
      
      redirect_to @fighter if @fighter.skills.count == 9
    end
end
