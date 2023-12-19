class Instrument < ApplicationRecord
  validates :name, :price, :condition, :availability, :category, presence: true

  belongs_to :user
  has_one_attached :photo
end
