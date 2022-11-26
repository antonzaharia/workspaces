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

Given(/^the workspace "([^"]+)" members with the following attributes:$/) do |slug, table|
  workspace = Workspace.find_by(slug: slug)
  attributes = extract_attributes_from_table(table)
  wu = WorkspaceUser.new(**attributes, workspace: workspace)
  user = User.find_by(email: attributes[:email])
  if user
    wu.update(user: user, has_account: true)
  else
    wu.save
  end
end

Then(/^all the member invites should be destroyed along with the workspace$/) do
  expect(WorkspaceUser.all.size).to eq(1)
end

Then(/^the workspace "([^"]+)" should have "([^"]+)" members$/) do |slug, n|
  workspace = Workspace.find_by(slug: slug)
  expect(workspace.workspace_users.all.size).to eq(n.to_i)
end