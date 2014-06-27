Then(/^"(.*?)" should have (\d+) transaction stages$/) do |transaction_name, count|
  Story.find_by_name(transaction_name).story_stages.count.should == count.to_i
end

Then(/^the last transaction stage should have "(.*?)" for "(.*?)"$/) do |val, att|
  StoryStage.last.send(att).name.should == val
end