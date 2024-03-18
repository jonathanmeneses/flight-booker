class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @flight_dates = Flight.distinct.order(arrival_date: :asc).pluck(:arrival_date).map do |d|
      [format_flight_date(d), d]
    end

    @searched_flights = search_flights
  end

  private

  def search_flights
    return [] unless params[:departure_id].present? && params[:arrival_id].present? && params[:flight_date].present?

    puts 'Searching for Flights'
    Flight.where(departure_airport_id: params[:departure_id],
                 arrival_airport_id: params[:arrival_id],
                 arrival_date: params[:flight_date])
  end

  # def search_params
  #   params.require(:flight).permit(:departure_id, :arrival_id, :num_passengers, :arrival_date)
  # end
end
