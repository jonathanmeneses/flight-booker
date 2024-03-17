class Flight < ApplicationRecord
  before_save :set_arrival_datetime

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  private

  def set_arrival_datetime
    # Check if depart_date, depart_time, and duration are present
    return unless depart_date.present? && depart_time.present? && duration.present?

    # Combine depart_date and depart_time to a full DateTime object for departure
    departure_datetime = DateTime.parse("#{depart_date} #{depart_time.strftime('%H:%M:%S')}")

    # Calculate arrival DateTime by adding duration (assumed to be in minutes)
    arrival_datetime = departure_datetime + duration.minutes

    # Set the arrival_date and arrival_time attributes
    self.arrival_date = arrival_datetime.to_date
    self.arrival_time = arrival_datetime.to_time
  end
end
