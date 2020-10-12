class LeaguesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @leagues = League.where(user: current_user)
    @allLeagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def settings
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

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    if @league.update(league_params)
      redirect_to league_path(@league)
    else
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to leagues_path
  end

  private

  def league_params
    params.require(:league).permit(:name, :user_id, :passcode)
  end
end
