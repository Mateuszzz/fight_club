class FightersController < ApplicationController
  
  def index
    if params[:first_params] || params[:second_params]
      @fighters= Fighter.find_fighter(params[:first_params], params[:second_params]).paginate(page: params[:page], per_page: 5)
    else
      @fighters = Fighter.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @fighter = Fighter.find(params[:id])
  end
  
  def ranking
    @per_page = 5
    @rank = 1
    @fighters = Fighter.order(experience_points: :desc, created_at: :asc).paginate(page: params[:page], per_page: @per_page)
  end

  def new
    @fighter = Fighter.new
  end
  
  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      flash[:success] = "Fighter was successfully created!"
      redirect_to @fighter
    else
      render 'new'      
    end
  end
  
  private
  
    def fighter_params
      params.require(:fighter).permit(:first_name, :last_name, :description, :avatar)
    end
end
