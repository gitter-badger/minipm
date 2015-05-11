class AddOwnerReferencesToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :owner, index: true
  end
end
