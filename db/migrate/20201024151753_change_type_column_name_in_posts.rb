class ChangeTypeColumnNameInPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_type, :string
    remove_column :posts, :type, :string
  end
end
