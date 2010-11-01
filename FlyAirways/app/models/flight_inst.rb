class FlightInst < ActiveRecord::Base
  belongs_to :flight
  has_many :seats
end
