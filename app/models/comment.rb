class Comment < ApplicationRecord
  belongs_to :bass
  validates :content, presence: true, length: { maximum: 50 }
  validates :rating, inclusion: { in: (0..5) }, numericality: { only_integer: true }
end
