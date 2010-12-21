class Photo < ActiveRecord::Base

  attr_accessible :photo

  belongs_to :property

  has_attached_file :photo, :styles => { :small => "150x150>" }

end
