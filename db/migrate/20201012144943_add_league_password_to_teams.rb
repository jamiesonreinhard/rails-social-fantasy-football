class AddLeaguePasswordToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :league_password, :string
  end
end
