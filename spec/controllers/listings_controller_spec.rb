require File.dirname(__FILE__) + '/../spec_helper'

describe ListingsController do
  fixtures :all
  integrate_views
  include Authlogic::TestCase

  before(:each) do
    activate_authlogic
    @user = Factory.create(:valid_user)
    UserSession.create @user
    @property_attributes = Factory.create(:property).attributes
  end


  it "should create a listing and a property" do
    assert_difference('Property.count + Listing.count', 2) do
      post :create, :listing => {:price => 100, :property => @property_attributes}
    end
    assert_redirected_to listing_path(assigns(:listing))
  end


  it "should not create a listing when the property is invalid" do
    assert_difference('Property.count + Listing.count', 0) do
      post :create, :listing => {:price => 200, :property => {:street_name => nil}}
    end
    assigns(:property).errors.should_not be_empty
  end


  it "should assign the new listing to the current user" do
    post :create, :listing => {:price => 200, :property => @property_attributes}
    @user.listings.should =~ [assigns(:listing)]
  end


  it "should let me update the listings property" do
    listing = Factory.create(:listing, :user => @user)
    expected_street_name = "new name"
    post :update, :id => listing.id, :listing=>{:price=>"200", :property=>{:street_name=>expected_street_name}}
    assigns(:listing).property.street_name.should == expected_street_name
  end

end
