class Listing < ActiveRecord::Base
  attr_accessible :property_id, :price, :available_date_from, :available_date_to
  belongs_to :property
  belongs_to :user
  accepts_nested_attributes_for :property
end
