class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :instruments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :instruments, through: :bookings
  has_one_attached :photo
end
