class LeaguesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @leagues = League.where(user: current_user)
    @allLeagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to league_path(@league)
    else
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
