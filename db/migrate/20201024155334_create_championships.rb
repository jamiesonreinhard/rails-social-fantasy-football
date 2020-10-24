class CreateChampionships < ActiveRecord::Migration[6.0]
  def change
    create_table :championships do |t|
      t.references :team, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
