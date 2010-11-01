class Seat < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight_inst

  
end
