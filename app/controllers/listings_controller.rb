class ListingsController < ApplicationController

  before_filter :require_user, :only => [:new, :edit, :update, :approve]

  def index
    @listings = Listing.find(:all, :include => :property)
  end

  def new
    @listing = Listing.new
    @listing.property = Property.new
  end

  def create
    @listing = Listing.new(params[:listing])
    @property = Property.new(params[:listing][:property])
    @listing.property = @property
    @listing.user = current_user
    if @listing.save && @property.save
      flash[:notice] = "Successfully created listing."
      redirect_to @listing
    else
      render :action => 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(params[:listing]) && @listing.property.update_attributes(params[:listing][:property])
      flash[:notice] = "Successfully updated listing."
      redirect_to @listing
    else
      render :action => 'edit'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @enquiries = @listing.enquiries.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          page.replace 'enquiries', :partial => 'enquiries'
        end
      }
    end
  end

  def approve_enquiry
    @enquiry = Enquiry.find(params[:enquiry_id])
    @enquiry.status = "approved"
    @enquiry.save!
    flash[:notice] = "Approved"
    redirect_to :back
  end

end
