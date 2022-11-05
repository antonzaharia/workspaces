require "application_system_test_case"

class WorkspaceUsersTest < ApplicationSystemTestCase
  setup do
    @workspace_user = workspace_users(:one)
  end

  test "visiting the index" do
    visit workspace_users_url
    assert_selector "h1", text: "Workspace users"
  end

  test "should create workspace user" do
    visit workspace_users_url
    click_on "New workspace user"

    fill_in "User", with: @workspace_user.user_id
    fill_in "Workspace", with: @workspace_user.workspace_id
    click_on "Create Workspace user"

    assert_text "Workspace user was successfully created"
    click_on "Back"
  end

  test "should update Workspace user" do
    visit workspace_user_url(@workspace_user)
    click_on "Edit this workspace user", match: :first

    fill_in "User", with: @workspace_user.user_id
    fill_in "Workspace", with: @workspace_user.workspace_id
    click_on "Update Workspace user"

    assert_text "Workspace user was successfully updated"
    click_on "Back"
  end

  test "should destroy Workspace user" do
    visit workspace_user_url(@workspace_user)
    click_on "Destroy this workspace user", match: :first

    assert_text "Workspace user was successfully destroyed"
  end
end
