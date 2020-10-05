class LeaguesController < ApplicationController
  def index
    @leagues = League.where(user: current_user)
  end

  def show
    @league = League.find(params[:id])
  end
end
