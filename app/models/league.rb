class League < ApplicationRecord
  has_many :teams
  has_many :posts
end
