class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @instruments = Instrument.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
    @bookings_as_owner = Booking.joins(:instrument).where(instruments: { user_id: current_user.id })
  end
end
