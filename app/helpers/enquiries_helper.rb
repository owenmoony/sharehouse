module EnquiriesHelper

  def lister?
    @enquiry.listing.user == current_user
  end

end
