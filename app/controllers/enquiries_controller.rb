class EnquiriesController < ApplicationController
  before_filter :require_user

  def new
    @enquiry = Enquiry.new
    @enquiry.listing = Listing.find(params[:listing_id])
  end
  
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    @enquiry.listing = Listing.find(params[:enquiry][:listing_id].to_i)
    @enquiry.user = current_user
    if @enquiry.save
      flash[:notice] = "Successfully created Enquiry."
      redirect_to @enquiry.listing
    else
      render :action => 'new'
    end
  end

  def show
    @enquiry = Enquiry.find(params[:id])
  end

  def index
    
  end
  
end
