class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to instrument_path(@instrument)
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(params[:instrument])
    @instrument.save
  end

  def edit
    @instrument = Instrument.find(params[:id])
    @instrument.update(params[:instrument])
    @instrument.save
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :condition, :category, :photo, :price)
  end
end
