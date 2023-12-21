
class Instrument < ApplicationRecord

  validates :name, :price, :condition, :category, :address, presence: true
  INSTRUMENTS = %w(accordion banjo bass clarinet drums flute guitar harmonica harp keyboard mandolin oboe piano saxophone trombone trumpet ukulele violin xylophone zither )
  CONDITIONS = %w(damaged regular good excellent)
  CATEGORIES = %w(string wind percussion keyboard)
  validates :name, inclusion: { in: INSTRUMENTS }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :category, inclusion: { in: CATEGORIES }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def not_available
    bookings.map do |booking|
      get_dates_in_range(booking.pick_up_date.strftime('%Y-%m-%d'), booking.drop_off_date.strftime('%Y-%m-%d'))
    end.flatten.join(" ")
  end

  def get_dates_in_range(start_date, end_date)
    require 'date'
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    dates = []

    start_date.upto(end_date) do |date|
      dates << date.strftime('%Y-%m-%d')
    end

    dates
  end

end
