require File.dirname(__FILE__) + '/../spec_helper'

describe PersonalisationOptions do
  before(:each) do
    @personalisation_options = PersonalisationOptions.new
  end

  it "should be valid" do
    @personalisation_options.should be_valid
  end
end
