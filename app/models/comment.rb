class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :content
  acts_as_votable
end
