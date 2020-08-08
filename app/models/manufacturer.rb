class Manufacturer < ApplicationRecord
  validates :name, presence: true
  has_many :basses
end
