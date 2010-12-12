class EnquiriesController < ApplicationController
  before_filter :require_user

  def new
    @enquiry = Enquiry.new
    listing = Listing.find(params[:listing_id])
    @enquiry.listing = listing
    @enquiry.available_date_from = listing.available_date_from
    @enquiry.available_date_to = listing.available_date_to
  end
  
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    @listing = Listing.find(params[:enquiry][:listing_id].to_i)
    @enquiry.listing = @listing
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

  def edit
    @enquiry = Enquiry.find(params[:id])
  end

  def update
    @enquiry = Enquiry.find(params[:id])
    if @enquiry.update_attributes(params[:enquiry])
      flash[:notice] = "Successfully update Enquiry"
      redirect_to @enquiry.listing
    else
      render :action => "edit"
    end
  end

  def index
    
  end
  
end
