class AddTokenToWorkspaceUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :workspace_users, :token, :string, default: SecureRandom.hex(10)
  end
end
