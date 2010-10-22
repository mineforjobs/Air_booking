class Seat < ActiveRecord::Base
    belongs_to :flight
  validates_presence_of :name,:address,:contact_no,:baggage
  validates_numericality_of :contact_no,:baggage
  
  def validate
    if baggage> flight.baggage_allowance
      errors.add_to_base("Baggage is more than allowance !!!")
    end
    if flight.seats.size >= flight.capacity
      errors.add_to_base("flight is fully booked !!")
    end

  end

end
