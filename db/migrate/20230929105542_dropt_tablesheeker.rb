class DroptTablesheeker < ActiveRecord::Migration[7.0]
  def change
    drop_table :jobsheekers
  end
end
