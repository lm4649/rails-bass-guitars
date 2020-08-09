class Bass < ApplicationRecord
  belongs_to :manufacturer
  has_many :comments, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :artists, through: :songs
  validates :name, presence: true
  validates :year, numericality: { integer_only: true }
  validates :string_num, inclusion: { in: 1..24 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 50 }
end


