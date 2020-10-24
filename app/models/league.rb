class League < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams
  has_many :posts, dependent: :destroy
  has_many :championships, dependent: :destroy
end
