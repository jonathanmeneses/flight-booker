class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:selected_flight])
    @booking = @flight.bookings.new
    @passengers = []
    params[:num_passengers].to_i.times { @passengers << @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |p|
        puts 'starting do loop'
        PassengerMailer.with(passenger: p, booking: @booking).booking_confirm_email.deliver_now
      end
      redirect_to booking_path(@booking), notice: 'Booking Successfully Created'
    else
      # Since save failed, no need to rebuild passengers; they are already built and contain errors if any.
      # You just need to ensure @flight is available for the view as it was in the `new` action.
      @flight = Flight.find(params[:booking][:flight_id])

      # Render the :new template to show the form again, with error messages.
      # The @booking object includes the attempted data and any validation errors.
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
