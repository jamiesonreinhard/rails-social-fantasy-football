class ChangePasswordToPasscodeInLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :passcode, :string
    remove_column :leagues, :password, :string
  end
end
