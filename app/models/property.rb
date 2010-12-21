class Property < ActiveRecord::Base
  attr_accessible :street_name, :street_number, :street_type, :suburb, :state, :postcode
  has_many :photos
  has_many :listings
  validates_presence_of :suburb
  
  def street_address
    [street_number, street_name, street_type].join(" ")
  end

  def address
    [street_address, suburb, state].join(", ")
  end

  def photo
    photos.first.photo if photos.first
  end

end
