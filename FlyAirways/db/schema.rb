# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101030134133) do

  create_table "airports", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "contact_no", :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flight_insts", :force => true do |t|
    t.integer  "flight_id"
    t.date     "date"
    t.integer  "seat_availablity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", :force => true do |t|
    t.integer  "flight_no"
    t.string   "source"
    t.string   "destination"
    t.integer  "capacity"
    t.time     "departure_time"
    t.time     "arrival_time"
    t.integer  "price",          :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", :force => true do |t|
    t.integer  "flight_inst_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "title"
    t.string   "f_name"
    t.string   "l_name"
    t.text     "address"
    t.integer  "contact_no",    :limit => 10, :precision => 10, :scale => 0
    t.string   "email"
    t.string   "role"
    t.string   "password"
    t.string   "payment_type"
    t.integer  "card_no"
    t.date     "exp_date"
    t.date     "issue_date"
    t.integer  "security_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
