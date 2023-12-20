class Instrument < ApplicationRecord
  validates :name, :price, :condition, :category, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
end
