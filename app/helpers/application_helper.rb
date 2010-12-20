# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_date(input_date)
    input_date.blank? ? "" : input_date.strftime("%d %B %Y")
  end

  def listing_link(listing)
    link_to listing.property.street_address show_listing_path(listing)
  end

end
