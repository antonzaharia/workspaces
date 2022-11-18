Then(/^the password "([^"]*?)" is valid for user "([^"]*?)"$/) do |password, email|
  user = User.find_by(email: email)
  expect(user.valid_password?(password)).to be(true)
end

Given(/^a user exists with the following attributes:$/) do |table|
  attributes = extract_attributes_from_table(table)
  @user = FactoryBot.create(:user, attributes)
end

Then(/^the user "([^"]*)" has the following attributes:$/) do |email, table|
  user = User.find_by(email: email)
  extract_attributes_from_table(table).each_pair do |key, val|
    expect(user[key].to_s).to eq(val)
  end
end

Given(/^I am logged in as:$/) do |table|
  attributes = extract_attributes_from_table(table)
  mapped_attrs = { email: attributes[:user_email], password: attributes[:user_password] }
  @user = FactoryBot.create(:user, mapped_attrs)

  visit '/users/sign_in'

  fill_in_form_details(safely: true, table: table)

  find('input[type=submit]').find('.actions').click

  find('.toastify', text: 'Signed in successfully.')
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