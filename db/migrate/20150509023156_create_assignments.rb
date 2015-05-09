class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :task, index: true
      t.references :assignee, index: true

      t.timestamps null: false
    end
  end
end
