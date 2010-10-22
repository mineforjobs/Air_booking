class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.integer :flight_id
      t.string :name
      t.string :address
      t.decimal :contact_no
      t.decimal :baggage

      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end
