class PagesController < ApplicationController
  def home
    @teams = Team.where(user: current_user)
  end
end
