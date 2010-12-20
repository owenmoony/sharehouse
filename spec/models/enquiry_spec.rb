require File.dirname(__FILE__) + '/../spec_helper'

describe Enquiry do
  it "should have a listing" do
    user = Factory.create(:valid_user, :email => "app@example.com", :login => "app")
    e = Factory.create(:enquiry, :user => user)
    e.should_not be_nil
    e.listing.should_not be_nil
    e.comment.should_not be_empty
  end

  it "should not create an enquiry when an application existing for this user" do
    enquiry = Factory.create(:enquiry)
  end
end
