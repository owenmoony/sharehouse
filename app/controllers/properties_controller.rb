class PropertiesController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :update]
  def index
    @properties = Property.all
  end

  def new
      @property = Property.new
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:notice] = "Successfully created property."
      redirect_to properties_url
    else
      render :action => 'new'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      flash[:notice] = "Successfully updated property."
      redirect_to properties_url
    else
      render :action => 'edit'
    end
  end
end
