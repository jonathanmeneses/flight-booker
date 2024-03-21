# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Durations were gathered as estimates via chatgpt
DURATIONS = {
  'AUS' => {
    'SFO' => 210, 'DFW' => 50, 'IAD' => 165, 'ORD' => 130, 'DEN' => 120, 'LAX' => 180, 'MSP' => 150, 'BOS' => 195, 'JFK' => 190
  },
  'SFO' => {
    'AUS' => 210, 'DFW' => 195, 'IAD' => 300, 'ORD' => 245, 'DEN' => 150, 'LAX' => 85, 'MSP' => 235, 'BOS' => 320, 'JFK' => 315
  },
  'DFW' => {
    'AUS' => 50, 'SFO' => 195, 'IAD' => 165, 'ORD' => 135, 'DEN' => 110, 'LAX' => 180, 'MSP' => 165, 'BOS' => 200, 'JFK' => 195
  },
  'IAD' => {
    'AUS' => 165, 'SFO' => 300, 'DFW' => 165, 'ORD' => 120, 'DEN' => 165, 'LAX' => 275, 'MSP' => 150, 'BOS' => 90, 'JFK' => 60
  },
  'ORD' => {
    'AUS' => 130, 'SFO' => 245, 'DFW' => 135, 'IAD' => 120, 'DEN' => 150, 'LAX' => 240, 'MSP' => 85, 'BOS' => 165, 'JFK' => 150
  },
  'DEN' => {
    'AUS' => 120, 'SFO' => 150, 'DFW' => 110, 'IAD' => 165, 'ORD' => 150, 'LAX' => 130, 'MSP' => 145, 'BOS' => 225, 'JFK' => 240
  },
  'LAX' => {
    'AUS' => 180, 'SFO' => 85, 'DFW' => 180, 'IAD' => 275, 'ORD' => 240, 'DEN' => 130, 'MSP' => 210, 'BOS' => 300, 'JFK' => 285
  },
  'MSP' => {
    'AUS' => 150, 'SFO' => 235, 'DFW' => 165, 'IAD' => 150, 'ORD' => 85, 'DEN' => 145, 'LAX' => 210, 'BOS' => 175, 'JFK' => 180
  },
  'BOS' => {
    'AUS' => 195, 'SFO' => 320, 'DFW' => 200, 'IAD' => 90, 'ORD' => 165, 'DEN' => 225, 'LAX' => 300, 'MSP' => 175, 'JFK' => 70
  },
  'JFK' => {
    'AUS' => 190, 'SFO' => 315, 'DFW' => 195, 'IAD' => 60, 'ORD' => 150, 'DEN' => 240, 'LAX' => 285, 'MSP' => 180, 'BOS' => 70
  }
}

def get_duration(origin, destination)
  # function to get duration between airports
  DURATIONS[origin][destination]
end

def random_time
  # generate a random time to apply to a flight
  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
end

Airport.create!([{
                  code: 'AUS',
                  name: 'Austin-Bergstrom International Airport',
                  city: 'Austin'
                },
                 {
                   code: 'SFO',
                   name: 'San Francisco International Airport',
                   city: 'San Francisco'
                 },
                 {
                   code: 'DFW',
                   name: 'Dallas Fort Worth International Airport',
                   city: 'Dallas'
                 },
                 {
                   code: 'IAD',
                   name: 'Dulles International Airport',
                   city: 'Washington, D.C.'
                 },
                 {
                   code: 'ORD',
                   name: "Chicago O'Hare International Airport",
                   city: 'Chicago'
                 },
                 {
                   code: 'DEN',
                   name: 'Denver International Airport',
                   city: 'Denver'
                 },
                 {
                   code: 'LAX',
                   name: 'Los Angeles International Airport',
                   city: 'Los Angeles'
                 },
                 {
                   code: 'MSP',
                   name: 'Minneapolis–Saint Paul International Airport',
                   city: 'St. Paul'
                 },
                 {
                   code: 'BOS',
                   name: 'Boston Logan International Airport',
                   city: 'Boston'
                 },
                 {
                   code: 'JFK',
                   name: 'John F. Kennedy International Airport',
                   city: 'Queens'
                 }])

p "Created #{Airport.count} Airports"

# Seeds flights
Date.today.upto(Date.today + 30).each do |day|
  Airport.all.each do |origin|
    Airport.all.each do |destination|
      next if origin == destination

      # 3 flights per day per origin --> destination combination)
      3.times do
        # Assumes the callback :set_arrival_datetime will create arrival date and time
        Flight.create(depart_date: day,
                      depart_time: random_time,
                      duration: get_duration(origin.code, destination.code),
                      departure_airport: origin,
                      arrival_airport: destination)
      end
    end
  end
  p "Created flights for #{day}"
end

p "Created #{Flight.count} Flights"
