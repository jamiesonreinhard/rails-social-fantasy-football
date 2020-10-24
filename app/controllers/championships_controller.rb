class ChampionshipsController < ApplicationController
  def new
    @league = League.find(params[:league_id])
    @championship = Championship.new
  end

  def create
    @league = League.find(params[:league_id])
    @championship = Championship.new(championship_params)
    if @championship.save
      redirect_to league_history_path(@league)
    else
      render :new
    end
  end

  def edit
    @league = League.find(params[:league_id])
    @championship = Championship.find(params[:id])
  end

  def update
    @league = League.find(params[:league_id])
    @championship = Championship.find(params[:id])
    if @championship.update(championship_params)
      redirect_to league_history_path(@league)
    else
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:league_id])
    @championship = Championship.find(params[:id])
    @championship.destroy
    redirect_to league_path(@league)
  end

  private

  def championship_params
    params.require(:championship).permit(:year, :league_id, :team_id)
  end
end
