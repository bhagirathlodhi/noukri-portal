class AddColunToRequestsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :gender, :string
  end
end
