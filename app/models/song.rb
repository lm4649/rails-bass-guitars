class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  belongs_to :bass
  has_one_attached :photo
  validates :photo, presence: true
  validates :title, presence: true
  validates :year, presence: true, inclusion: { in: 1940..2020 }, numericality: { only_integer: true }
  validates :album, uniqueness: { scope: :title }
end
