class CreateWorkspaceUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :workspace_users do |t|
      t.integer :user_id
      t.integer :workspace_id
      t.string :email
      t.string :status, default: 'pending'
      t.boolean :has_account, default: false

      t.timestamps
    end
  end
end
