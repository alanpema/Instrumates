class Booking < ApplicationRecord
  belongs_to :user
  has_many :instruments
  validates :pick_up_date, :drop_off_date, :final_price, presence: true
end
