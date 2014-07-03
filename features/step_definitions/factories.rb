Given(/^I have a transaction called "(.*?)"$/) do |name|
  FactoryGirl.create(:story, :name => name)
end

Given(/^I have a person called "(.*?)"$/) do |name|
  FactoryGirl.create(:system, :name => name)
end

Given(/^I have a system called "(.*?)"$/) do |name|
  FactoryGirl.create(:system, :name => name)
end

Given(/^I have a group called "(.*?)"$/) do |name|
  FactoryGirl.create(:group, :name => name)
end

Given(/^"(.*?)" is in group "(.*?)"$/) do |transaction_name, group_name|
  transaction = Story.find_by_name(transaction_name)
  group = Group.find_by_name(group_name)
  transaction.groups << group
  transaction.save!
end
