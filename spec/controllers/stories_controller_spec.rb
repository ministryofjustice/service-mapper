require 'spec_helper'

describe StoriesController do
  describe "catch_new_groups" do
    before(:each) do
      @controller = StoriesController.new
      @group = FactoryGirl.create(:group)
      @params = {:story => {}}
      @controller.stub(:params).and_return(@params)
      @params[:story][:group_ids] = [@group.id.to_s, "New Group"]
      @controller.send(:catch_new_groups)
    end
    it "should create a new group" do
      Group.last.name.should == "New Group"
    end
    it "should update the params with id" do
      @params[:story][:group_ids].should == [@group.id.to_s, Group.last.id.to_s]
    end
  end
end
