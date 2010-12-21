class ListingsController < ApplicationController

  before_filter :require_user, :only => [:new, :edit, :update, :approve]
  before_filter :must_be_listing_user, :except => [:new, :create, :show, :index]


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
    @photo = Photo.new(params[:listing][:property][:photo])
    @listing.property = @property
    @listing.user = current_user
    @property.photos = [@photo]
    if @listing.save && @property.save && @photo.save
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
    photo = @listing.property.photos.first
    photo_update_result = photo.update_attributes(params[:listing][:property][:photo]) if photo
    if @listing.update_attributes(params[:listing]) &&
            @listing.property.update_attributes(params[:listing][:property]) &&
            photo_update_result
      flash[:notice] = "Successfully updated listing."
      redirect_to @listing
    else
      render :action => 'edit'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @enquiries = @listing.enquiries.paginate(:page => params[:page], :per_page => 4)
    @my_application = @listing.enquiries.find_all{|e| e.user == current_user && e.enquiry_type == "application"}.first
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
    flash[:notice] = "The application for '#{@enquiry.user.login}' has been approved"
    return redirect_to :back
  end

  def reject_enquiry
    @enquiry = Enquiry.find(params[:enquiry_id])
    @enquiry.status = "rejected"
    @enquiry.save!
    flash[:notice] = "The application for '#{@enquiry.user.login}' has been rejected"
    return redirect_to :back
  end

  def must_be_listing_user
    id = params[:id] || params[:listing_id]
    @listing = Listing.find(id)
    if current_user != @listing.user
      flash[:error] = "Only the listing user '#{@listing.user.login}' can do this action."
      return redirect_to :back
    end
  end

end
