require File.dirname(__FILE__) + '/../spec_helper'

describe Property do
  it "should be valid" do
    Property.new.should be_valid
  end
end
