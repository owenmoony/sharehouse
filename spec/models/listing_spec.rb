require File.dirname(__FILE__) + '/../spec_helper'

describe Listing do
  it "should have a property" do
    l = Factory.create(:listing)
    l.should_not be_nil
    l.property.should_not be_nil
    l.property.listings.size.should == 1
  end
end
