class User < ActiveRecord::Base
  acts_as_authentic
  has_many :listings
  has_many :enquiries
end

