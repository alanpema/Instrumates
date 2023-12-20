class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  # OWNER:
  has_many :created_instruments, class_name: "Instrument", foreign_key: "user_id", dependent: :destroy
  has_many :owner_bookings, through: :created_instruments, source: :bookings

  # RENTER:
  has_many :customer_bookings, class_name: "Booking", foreign_key: "user_id", dependent: :destroy
  has_many :rented_instruments, through: :customer_bookings, source: :instrument
end
