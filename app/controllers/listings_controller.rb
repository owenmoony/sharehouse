class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  
  def new
    @listing = Listing.new
    @property = Property.new
  end
  
  def create
    @listing = Listing.new(params[:listing])
    if @listing.save
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
    if @listing.update_attributes(params[:listing])
      flash[:notice] = "Successfully updated listing."
      redirect_to @listing
    else
      render :action => 'edit'
    end
  end
  
  def show
    @listing = Listing.find(params[:id])
  end
end
