Then(/^"(.*?)" should have (\d+) transaction stages$/) do |transaction_name, count|
  Story.find_by_name(transaction_name).story_stages.count.should == count.to_i
end

Then(/^the last transaction stage should have "(.*?)" for "(.*?)"$/) do |val, att|
  val = StoryStage.last.send(att)
  if val.is_a? ActiveRecord::Base
    val = val.name
  end
  val.should == val
end

When(/^the system "(.*?)" should have "(.*?)" for "(.*?)"$/) do |name, val, att|
  System.find_by_name(name).send(att).should == val
end
