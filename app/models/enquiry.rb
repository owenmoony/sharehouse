class Enquiry < ActiveRecord::Base

  ENQUIRE_TYPES = %w(  application comment question  )
  STATUSES = %w(  new approved rejected  )

  belongs_to :listing
  belongs_to :user

  cattr_reader :per_page

  validates_presence_of :enquiry_type
  validates_inclusion_of :status, :in => STATUSES

  @@per_page = 10

  def approved?
    status == "approved"
  end

  def rejected?
    status == "rejected"
  end

  def self.find_existing_application(user_id, listing_id)
    Enquiry.listing_id_equals(listing_id).user_id_equals(user_id).enquiry_type_equals("application").first
  end

end