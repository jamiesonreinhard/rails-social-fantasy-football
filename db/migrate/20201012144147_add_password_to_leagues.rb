class AddPasswordToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :password, :string
  end
end
