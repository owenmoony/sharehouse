require File.dirname(__FILE__) + '/../spec_helper'

describe EnquiriesController do
  fixtures :all
  integrate_views
  include Authlogic::TestCase

  before(:each) do
    activate_authlogic
    @user = Factory.create(:valid_user)
    UserSession.create @user
    @property_attributes = Factory.create(:property).attributes
  end


  it "should create an enquiry" do
    listing = Factory.create(:listing)
    assert_difference('Enquiry.count', 1) do
      post :create, :enquiry => {
              :enquiry_type => :application,
              :listing_id => listing.id,
              :comment => Faker::Lorem.sentences}
    end
    assert_redirected_to listing_path(assigns(:listing))
  end
  
end
