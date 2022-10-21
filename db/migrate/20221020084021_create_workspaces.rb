class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.string :primary_color
      t.string :secondary_color

      t.timestamps
    end
  end
end
