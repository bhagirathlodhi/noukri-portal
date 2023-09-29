class AddColumntoUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date_of_birth
  end
end
