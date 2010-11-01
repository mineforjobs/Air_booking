class Flight < ActiveRecord::Base
  has_many :flight_inst
  
  validates_presence_of :flight_no,:source,:destination,:departure_time,:arrival_time,:capacity,:price
  validates_numericality_of :capacity,:price
  validates_uniqueness_of :flight_no


end
