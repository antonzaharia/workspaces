class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :plus, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :dob, :date
  end
end
