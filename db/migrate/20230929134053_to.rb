class To < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :contact_number, :string
    add_column :requests, :email, :string
  end
end
