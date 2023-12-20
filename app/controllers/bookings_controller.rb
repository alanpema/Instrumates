class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.user = current_user
    if @booking.save
      redirect_to instrument_booking_path(@instrument, @booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to instruments_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
