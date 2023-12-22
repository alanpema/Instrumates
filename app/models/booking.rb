class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User", foreign_key: "user_id"  # the one who rents the instrument
  belongs_to :instrument
  has_one :owner, through: :instrument, source: :user, foreign_key: "user_id" # the one who owns the instrument
  enum status: { pending: 0, accepted: 1, declined: 2 }
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

  def final_price
    price = instrument.price
    range = (get_dates_in_range(pick_up_date.strftime('%Y-%m-%d'), drop_off_date.strftime('%Y-%m-%d')).count - 1)
    return  range * price
  end
  def ranged_dates
    range = (get_dates_in_range(pick_up_date.strftime('%Y-%m-%d'), drop_off_date.strftime('%Y-%m-%d')).count - 1)

  end
end
