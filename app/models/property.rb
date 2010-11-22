class Property < ActiveRecord::Base
  attr_accessible :street_name, :street_number, :street_type, :suburb, :state, :postcode
end
