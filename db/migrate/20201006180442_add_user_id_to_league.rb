class AddUserIdToLeague < ActiveRecord::Migration[6.0]
  def change
    add_reference :leagues, :user, null: false, foreign_key: true
  end
end
