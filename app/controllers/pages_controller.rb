class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @teams = Team.where(user: current_user)
  end
end
