class Flight < ApplicationRecord

  belongs_to :departing_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

end
