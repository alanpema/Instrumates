class Instrument < ApplicationRecord
  INSTRUMENTS = %w(accordion banjo bass clarinet drums flute guitar harmonica harp keyboard mandolin oboe piano saxophone trombone trumpet ukulele violin xylophone zither )
  CONDITIONS = %w(damaged regular good excellent)
  CATEGORIES = %w(string wind percussion keyboard)
  validates :name, :price, :condition, :category, presence: true
  validates :name, inclusion: { in: INSTRUMENTS }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :category, inclusion: { in: CATEGORIES }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  def not_available
    bookings.map do |booking|
      [booking.pick_up_date.strftime("%Y-%m-%d"), booking.drop_off_date.strftime("%Y-%m-%d")]

        #Instrument.find(8).bookings.map(&:pick_up_date)[0].strftime("%Y-%m-%d")
    end.flatten.join(" ")
  end
end
