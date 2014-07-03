require 'spec_helper'

describe StoryStage do
  describe "previous_stage" do
    before(:each) do
      @story = FactoryGirl.create(:story)
      @stage1 = FactoryGirl.create(:story_stage, :story => @story, :position => 1)
      @stage2 = FactoryGirl.create(:story_stage, :story => @story, :position => 2)
      @stage3 = FactoryGirl.create(:story_stage, :story => @story, :position => 3)
      @stage4 = FactoryGirl.create(:story_stage, :story => @story, :position => 4)
    end
    it "should correctly return the previous stage in order" do
      @stage3.previous_stage.should == @stage2
    end
    it "should not error if no previous stage" do
      @stage1.previous_stage.should == nil
    end
  end

  describe "linked_with_last_stage?" do
    before(:each) do
      @story = FactoryGirl.create(:story)
      @system1 = FactoryGirl.create(:system)
      @system2 = FactoryGirl.create(:system)
      @system3 = FactoryGirl.create(:system)
      @stage1 = FactoryGirl.create(:story_stage, :story => @story, :position => 1, :from => @system1, :to => @system2)
      @stage2 = FactoryGirl.create(:story_stage, :story => @story, :position => 2, :from => @system2, :to => @system3)
      @stage3 = FactoryGirl.create(:story_stage, :story => @story, :position => 3, :from => @system2, :to => @system1)
    end
    it "should return true if linked" do
      @stage2.linked_with_last_stage?.should == true
    end
    it "should return false if linked" do
      @stage3.linked_with_last_stage?.should == false
    end
    it "should return false if first system" do
      @stage1.linked_with_last_stage?.should == false
    end
  end
end
