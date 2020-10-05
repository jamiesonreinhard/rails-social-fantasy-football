class TeamsController < ApplicationController
  def index
    @teams = Team.where(user: current_user)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @leagues = League.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :hometown, :league_id, :user_id)
  end

end
