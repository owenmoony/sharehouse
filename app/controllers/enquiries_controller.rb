class EnquiriesController < ApplicationController

  before_filter :require_user

  def new
    listing = Listing.find(params[:listing_id])
    existing_enquiry = Enquiry.find_existing_application(current_user.id, listing.id)
    if existing_enquiry
      flash[:notice] = "You have already applied, here is your application..."
      return redirect_to edit_listing_enquiry_path(listing.id, existing_enquiry.id)
    end
    @enquiry = Enquiry.new
    @enquiry.listing = listing
    @enquiry.user = current_user
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

  def destroy
    Enquiry.delete(params[:id])
    redirect_to :back
  end

  def index
    
  end
  
end
