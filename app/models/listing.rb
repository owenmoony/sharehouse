class Listing < ActiveRecord::Base
  attr_accessible :property_id, :price, :available_date_from, :available_date_to
  belongs_to :property
end
