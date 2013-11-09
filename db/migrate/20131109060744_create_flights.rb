class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.datetime :departuretime
      t.string :flightnumber
      t.string :departureairport
      t.string :arrivalairport

      t.timestamps
    end
  end
end
