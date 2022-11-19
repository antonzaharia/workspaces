Given(/^a workspace exists with the following attributes:$/) do |table|
  attributes = extract_attributes_from_table(table)
  @workspace = FactoryBot.create(:workspace, attributes)
end

Given(/^the user "([^"]+)" has a workspace with the following attributes:$/) do |email, table|
  user = User.find_by(email: email)
  attributes = extract_attributes_from_table(table)
  attributes[:user_id] = user.id
  @workspace = FactoryBot.create(:workspace, attributes)
end
