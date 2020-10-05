class AddLeagueIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :league, null: false, foreign_key: true
  end
end
