class AddreferencesToJobsheeker < ActiveRecord::Migration[7.0]
  def change
  add_reference :jobsheekers, :apply, foreign_key: true
  end
end
