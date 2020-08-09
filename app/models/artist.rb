class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :basses, through: :songs
  validates :name, presence: true
end
