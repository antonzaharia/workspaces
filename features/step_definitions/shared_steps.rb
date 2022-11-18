require 'pry'

And(/^binding\.pry$/) do
  binding.pry
end

And(/^I wait "([^"]+)" seconds$/) do |seconds|
  sleep seconds.to_i
end

And(/^I visit "([^"]+)"$/) do |path|
  visit path
end

And(/^I click "([^"]+)"$/) do |label|
  click_on label
end

And(/^I should see toast "([^"]+)"$/) do |text|
  find('.toastify', text: text)
end

And(/I should see the selector "([^"]+)" from the container "([^"]+)" with text "([^"]+)"/) do |selector, container, text|
  find(container).find(selector, text: text)
end

When(/^I fill in "(.+)" with "(.+)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I fill in the following form details( safely)?:$/) do |safely, table|
  fill_in_form_details(safely: safely, table: table)
end

And(/^I check the checkbox "([^"]+)"$/) do |option|
  check option
end

And(/I click on the selector "([^"]+)" from the container "([^"]+)"/) do |selector, container|
  find(container).find(selector).click
end


