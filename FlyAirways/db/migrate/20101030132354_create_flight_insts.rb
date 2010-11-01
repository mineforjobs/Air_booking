class CreateFlightInsts < ActiveRecord::Migration
  def self.up
    create_table :flight_insts do |t|
      t.integer :flight_id
      t.date :date
      t.integer :seat_availablity

      t.timestamps
    end
  end

  def self.down
    drop_table :flight_insts
  end
end
