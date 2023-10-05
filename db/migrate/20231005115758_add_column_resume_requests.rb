class AddColumnResumeRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :resume, :attachment
  end
end
