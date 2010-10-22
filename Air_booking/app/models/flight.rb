class Flight < ActiveRecord::Base
  has_many :seats

  validates_presence_of :destination,:baggage_allowance,:capacity
  validates_numericality_of :baggage_allowance,:capacity

end
