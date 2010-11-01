class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.integer :flight_inst_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end