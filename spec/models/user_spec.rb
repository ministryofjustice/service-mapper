require 'spec_helper'

describe User do
  describe "roles" do
    it "should be unverified if not a digital email address" do
      FactoryGirl.create(:user, :email => 'test.data@digital.not.justice.gov.uk').role.should == 'unverified'
    end
    it "should be editor if a digital email address" do
      FactoryGirl.create(:user, :email => 'test.data@digital.justice.gov.uk').role.should == 'editor'
    end
  end
end
