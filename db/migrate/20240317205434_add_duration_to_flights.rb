class AddDurationToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :duration, :integer
  end
end
