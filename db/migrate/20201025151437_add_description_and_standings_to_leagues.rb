class AddDescriptionAndStandingsToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :description, :text
  end
end
