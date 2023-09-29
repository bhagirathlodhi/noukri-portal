class AddReferencesToRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :job, null: false, foreign_key: true
  end
end
