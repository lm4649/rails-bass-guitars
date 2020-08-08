class Artist < ApplicationRecord
  has_many :songs
  has_many :basses, through: :songs
  validates :name, presence: true
end
