class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User", foreign_key: "user_id"  # the one who rents the instrument
  belongs_to :instrument
  has_one :owner, through: :instrument, source: :user, foreign_key: "user_id" # the one who owns the instrument
end
