# Flight Booker Project Checklist

## Introduction
- [ ] Get familiar with the project requirements.
- [ ] Understand the flow of booking a one-way flight.

## Assignment
- [ ] Create a one-way flight booker application.

### Setup
- [X] Think through the data architecture.
- [X] Create a new Rails app and a new Git repo.
- [X] Modify the README to explain the project.

### Screen 1: Search
- [X] Create an Airport model with an airport code.
- [X] Use db/seeds.rb to create several airports.
- [X] Create a Flight model with departure and arrival airport IDs, start datetime, and flight duration.
- [X] Set up associations for Flight and Airport models.
- [X] Seed your database with flights.
- [X] Set up FlightsController and routes, making the Index page (/flights) the root route.
- [ ] Create a search form on the /flights index page to submit using a GET request.
- [ ] Add dropdown menus for departure airports, arrival airports, number of passengers, and flight date.

### Screen 2: Pick a Flight
- [ ] Handle form submission in your controller to pull flights matching search criteria.
- [ ] Display the search results in the app/views/flights/index.html.erb view.
- [ ] Keep the search form active for new searches.
- [ ] Allow users to select a flight with a radio button next to each result.

### Screen 3: Passenger Information
- [ ] Create and migrate the Booking model.
- [ ] Create and migrate the Passenger model.
- [ ] Set up associations between Bookings, Passengers, and Flights.
- [ ] Create a BookingsController with appropriate routes.
- [ ] Set up the #new action for the booking form, displaying the chosen flight and fields for passenger information.
- [ ] Implement the #create action to handle form submission, creating a new Booking and associated Passengers.
- [ ] Implement accepts_nested_attributes_for in the Booking model.
- [ ] Render the booking’s #show page with booking information upon successful form submission.

## Final Steps
- [ ] Test the entire ticketing flow to ensure everything works as expected.
- [ ] Refactor code and check for any possible improvements.
- [ ] Update the README with any final thoughts or post-completion reflections.


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


