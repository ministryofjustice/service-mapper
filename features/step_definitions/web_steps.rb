require 'uri'

Given /^pending$/ do
  pending
end

Then /^debug$/ do
  debugger
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, dropdown|
  select(value, from: dropdown) 
end

When /^I choose "([^\"]*)"$/ do |value|
  choose(value) 
end

When(/^I check "(.*?)"$/) do |field|
  check(field) 
end

Then(/^I uncheck "(.*?)"$/) do |field|
  uncheck(field) 
end

Then /^I should see the text "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see all of the texts:?$/ do |table|
  table.raw.each do |text|
    step "I should see the text \"#{text[0]}\""
  end
end

Then /^I should not see the text "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see the image "([^"]*)"$/ do |image_name|
    page.should have_xpath("//img[contains(@src, \"#{image_name}\")]")
end

Then /^I should see all of the images:?$/ do |table|
  table.raw.each do |text|
    step "I should see the image \"#{text[0]}\""
  end
end

Then /^I attach the file "([^"]*)" to form field "([^"]*)"$/ do |filename, field_name|
  attach_file(field_name, File.join(Rails.root, filename))
end

Then /^I should see the HTML5 audio source "([^"]*)"$/ do |audio_name|
  page.should have_xpath("//audio[contains(@src, \"#{audio_name}\")] | //audio/source[contains(@src, \"#{audio_name}\")]")
end

Then /^I should see all of the HTML5 audio sources:?$/ do |table|
  table.raw.each do |text|
    step "I should see the HTML5 audio source \"#{text[0]}\""
  end
end

Then /^I should see the HTML5 video source "([^"]*)"$/ do |video_name|
  page.should have_xpath("//video[contains(@src, \"#{video_name}\")] | //video/source[contains(@src, \"#{video_name}\")]")
end

Then /^I should see all of the HTML5 video sources:$/ do |table|
  table.raw.each do |text|
    step "I should see the HTML5 video source \"#{text[0]}\""
  end
end

Then /^I should see an? link that points to "([^"]*)"$/ do |href_destination|
  page.should have_xpath("//a[@href='#{href_destination}']")
end

Then /^I should see an? "([^"]*)" tag around the text "([^"]*)"$/ do |tag_name, text|
  page.should have_xpath("//#{tag_name}[text()=\"#{text}\"]")
end

Then /^I should see an? "([^"]*)" with "([^"]*)" of "([^"]*)"$/ do |tag_name, attribute_name, attribute_value|
  page.should have_xpath("//#{tag_name}[@#{attribute_name}=\"#{attribute_value}\"]")
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Given /^(?:|I )go to (.+)$/ do |page_name|
  visit page_name
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  if defined?(Spec::Rails::Matchers)
    current_path.should == path_to(page_name)
  else
    assert_equal page_name, current_path
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I wait (\d+) seconds?$/ do |length_of_pause|
  sleep(length_of_pause.to_i)
end

When /^I accept the confirmation dialog box$/ do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should see the html "(.*?)"$/) do |html_expected|
  page.body.should include(html_expected)
end
