class Post < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_rich_text :content
end
