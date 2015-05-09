class AddOwnerReferencesToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :owner, index: true, foreign_key: true
  end
end
