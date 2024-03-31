# Flight Booker Project Checklist

## Stimulus Additions
[ ] - Add ability to add or delete passengers from an existing booking
[ ] - Add ability to edit passenger information in an existing booking 

# Scratch
## DB Modeling

### Airports
#### Attributes
* Code
* Airport Name
#### Associations
* has_many departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'
* has_many arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'

### Flights
#### Attributes
* Depart Time
* Arrival Time
* Date
* Departure Airport
* Destination Airport

#### Associations
* Belongs_to departing_airport
* belongs_to Arriving_airport
* has_many bookings
* has_many passengers :through :bookings





### Passengers
* Note: We won't be grabbing more than one address of billing information, so we're keeping this pretty simple
#### Attributes

* Name
* Phone Number
* Contact Details


#### Associations

has_many :bookings
has_many :flights, through: :bookings


### Bookings
#### Attributes

#### Associations

belongs_to :flight
has_many :passenger_bookings
has_many :passengers, through :passenger_bookings

### PassengerBookings
This is a join table
#### Attributes
* Booking ID
* Passenger ID
#### Associations
* belongs_to :booking
* belongs to :passenger


