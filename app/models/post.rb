class Post < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :comments, dependent: :destroy
  has_rich_text :content
  has_one_attached :document
  acts_as_votable
end
