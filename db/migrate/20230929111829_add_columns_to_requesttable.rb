class AddColumnsToRequesttable < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :name, :string
    add_column :requests, :age, :string
    add_column :requests, :address, :string
    add_column :requests, :currentsalary, :string
    add_column :requests, :position, :string
    add_column :requests, :yop, :string
  end
end
