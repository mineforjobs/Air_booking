class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :title
      t.string :f_name
      t.string :l_name
      t.text :address
      t.decimal :contact_no
      t.string :email
      t.string :role
      t.string :password
      t.string :payment_type
      t.integer :card_no
      t.date :exp_date
      t.date :issue_date
      t.integer :security_code

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
