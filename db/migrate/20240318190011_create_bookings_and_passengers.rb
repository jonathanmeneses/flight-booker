class CreateBookingsAndPassengers < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
    create_table :passengers do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
