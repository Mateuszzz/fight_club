class SkillsController < ApplicationController
  
  def new
    @fighter = Fighter.find(params[:fighter_id])
    @skill = Skill.new
  end
  
  def create
    @fighter = Fighter.find(params[:fighter_id])
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
end
