class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.integer :flight_no
      t.string :source
      t.string :destination
      t.integer :capacity
      t.time :departure_time
      t.time :arrival_time
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
