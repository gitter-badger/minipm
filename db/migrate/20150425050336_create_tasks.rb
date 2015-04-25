class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :finished, default: false
      t.belongs_to :project, index: true

      t.timestamps null: false
    end
  end
end
