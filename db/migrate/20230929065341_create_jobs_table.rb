class CreateJobsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :experience
      t.string :salary
      t.string :location
      t.string :skills
      t.string :description
      t.timestamps
    end
  end
end
