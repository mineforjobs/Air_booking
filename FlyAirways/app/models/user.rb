class User < ActiveRecord::Base
  has_many :seats

  TITLES = ['Mr', 'Mrs', 'Miss']
  PAYTYPE=['Master card','Debit Card','American Express']

  
  validates_presence_of :f_name,:l_name,:address,:contact_no,:password,:email,:security_code,:card_no
 validates_format_of :email,:with => /(.+)@(.+)\.(.{3})/
 validates_uniqueness_of :email
 validates_confirmation_of :password
 validates_numericality_of :contact_no,:security_code,:card_no
 validates_size_of :contact_no,:security_code,:card_no, :maximum => 10

end
