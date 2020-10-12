class TeamsController < ApplicationController
  def index
    @teams = Team.where(user: current_user)
  end

  def show
    @team = Team.find(params[:id])
  end

  def settings
    @team = Team.find(params[:id])
  end

  def new
    @leagues = League.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    league_id = @team.league_id
    @league = League.find(league_id)
    if @team.league_password == @league.password
      if @team.save
        redirect_to team_path(@team)
      else
        render :new
      end
    else
      redirect_to new_team_path
    end
    
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :hometown, :league_id, :user_id, :league_password)
  end

end
