class AddReferenceTojobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :user, foreign_key: true
  end
end
