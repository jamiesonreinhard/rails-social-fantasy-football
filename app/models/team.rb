class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :championships, dependent: :destroy
end
