
class Instrument < ApplicationRecord
  validates :name, :price, :condition, :category, :address, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def not_available
    bookings.map do |booking|
      [booking.pick_up_date.strftime("%Y-%m-%d"), booking.drop_off_date.strftime("%Y-%m-%d")]

        #Instrument.find(8).bookings.map(&:pick_up_date)[0].strftime("%Y-%m-%d")
    end.flatten.join(" ")
  end
end
