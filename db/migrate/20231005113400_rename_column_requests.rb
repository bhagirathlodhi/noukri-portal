class RenameColumnRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :requests, :age, :date_of_birth
  end
end
