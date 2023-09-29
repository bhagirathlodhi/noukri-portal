class CreateFollowabilityRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :followability_relationships do |t|
      t.belongs_to :user, polymorphic: true, null: false
      t.belongs_to :job, polymorphic: true, null: false
      t.integer :status

      t.timestamps
    end
  end
end
