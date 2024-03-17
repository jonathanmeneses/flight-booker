# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Airport.create!([{
code: "AUS" ,
name: "Austin-Bergstrom International Airport",
city: "Austin"},
{
code: "SFO" ,
name: "San Francisco International Airport",
city: "San Francisco"},
{
code: "DFW" ,
name: "Dallas Fort Worth International Airport",
city: "Dallas"},
{
code: "IAD" ,
name: "Dulles International Airport",
city: "Washington, D.C."},
{
code: "ORD" ,
name: "Chicago O'Hare International Airport",
city: "Chicago"},
{
code: "DEN" ,
name: "Denver International Airport",
city: "Denver"},
{
code: "LAX" ,
name: "Los Angeles International Airport",
city: "Los Angeles"},
{
code: "MSP" ,
name: "Minneapolis–Saint Paul International Airport",
city: "St. Paul"},
{
code: "BOS" ,
name: "Boston Logan International Airport",
city: "Boston"},
{
code: "JFK" ,
name: "John F. Kennedy International Airport",
city: "Queens"}
])

p "Created #{Airport.count} Airports"
