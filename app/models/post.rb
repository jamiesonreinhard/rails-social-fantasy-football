class Post < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :comments
  has_rich_text :content
end
