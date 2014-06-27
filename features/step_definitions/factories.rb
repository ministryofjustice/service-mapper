Given(/^I have a transaction called "(.*?)"$/) do |name|
  FactoryGirl.create(:story, :name => name)
end

Given(/^I have a person called "(.*?)"$/) do |name|
  FactoryGirl.create(:person, :name => name)
end

Given(/^I have a system called "(.*?)"$/) do |name|
  FactoryGirl.create(:system, :name => name)
end

Given(/^I have a group called "(.*?)"$/) do |name|
  FactoryGirl.create(:group, :name => name)
end
