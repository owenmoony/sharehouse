class Enquiry < ActiveRecord::Base
  ENQUIRE_TYPES = %w(application comment question)
  STATUSES = %w(new approved rejected)
  belongs_to :listing
  belongs_to :user
  validates_presence_of :enquiry_type
  cattr_reader :per_page
  validates_inclusion_of :status, :in => STATUSES

  @@per_page = 10
end