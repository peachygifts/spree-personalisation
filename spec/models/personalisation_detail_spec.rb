require File.dirname(__FILE__) + '/../spec_helper'

describe PersonalisationDetail do
  before(:each) do
    @personalisation_detail = PersonalisationDetail.new
  end

  it "should be valid" do
    @personalisation_detail.should be_valid
  end
end
