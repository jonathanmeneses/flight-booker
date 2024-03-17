class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.time :depart_time
      t.date :depart_date
      t.time :arrival_time
      t.date :arrival_date
      t.references :departure_airport, null: false, foreign_key: {to_table: :airports}
      t.references :arrival_airport, null: false, foreign_key: {to_table: :airports}
      t.timestamps
    end
  end
end
