class ChangeColumnTypeInRequestsTable < ActiveRecord::Migration[7.0]
  def change
    change_column(:requests, :resume, :string)
  end
end
