class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to instrument_path(@instrument)
  end


  def edit
    @instrument = Instrument.find(params[:id])
    render turbo_stream: turbo_stream.replace(:instrument, partial: "instruments/turbo_frames/edit")
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    @instrument.save
    render turbo_stream: turbo_stream.replace(:edit_instrument, partial: "instruments/turbo_frames/show")
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
