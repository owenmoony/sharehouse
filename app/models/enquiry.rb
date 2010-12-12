class Enquiry < ActiveRecord::Base
  ENQUIRE_TYPES = %w(application comment question)
  belongs_to :listing
  belongs_to :user
  validates_presence_of :enquiry_type
  cattr_reader :per_page
  @@per_page = 10
end