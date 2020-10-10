class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teams, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :leagues, dependent: :destroy
  has_one_attached :avatar
  include Gravtastic
  gravtastic
end
