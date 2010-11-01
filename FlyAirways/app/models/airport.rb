class Airport < ActiveRecord::Base
  belongs_to :flight

  validates_presence_of :name,:address,:contact_no
validates_numericality_of :contact_no
validates_size_of :contact_no, :maximum => 10
validates_uniqueness_of :name

end
