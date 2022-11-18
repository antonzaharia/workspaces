require 'pry'

And(/^binding\.pry$/) do
  binding.pry
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

Given(/^a user exists with the following attributes:$/) do |table|
  attributes = extract_attributes_from_table(table)
  @user = FactoryBot.create(:user, attributes)
end

def fill_in_form_details(safely:, table:)
  table.transpose.hashes.first.each_pair do |field, value|
    complete_form_field(safely: safely, field: field, value: value)
  end
end

def extract_attributes_from_table(table)
  attributes = {}
  table.transpose.hashes.first.each_pair do |attribute, string_value|
    if string_value.blank?
      value = nil
    elsif string_value.match(/^(\d+)\.(seconds?|minutes?|hours?|days?|weeks?|months?|years?).ago$/)
      value = DateTime.now.advance(Regexp.last_match(2).to_sym => (Regexp.last_match(1).to_i)*-1)
    else
      value = string_value
    end
    attributes[attribute.to_sym] = value
  end
  return attributes
end

def complete_form_field(safely:, field:, value:)
  if safely
    page.fill_in(field, with: '')

    element = page.all("##{field}", wait: 0.1).first || page.all("[name='#{field}']", wait: 0.1).first
    value.split.each do |char|
      element.send_keys(char)
    end

  else
    page.fill_in(field, with: value)
  end
end
