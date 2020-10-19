class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :post
  has_rich_text :content
end
