class Property < ActiveRecord::Base
  attr_accessible :street_name, :street_number, :street_type, :suburb, :state, :postcode
  has_many :listings
  validates_presence_of :street_name
end
