class AddColumnJobsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :vacancy, :integer
  end
end
