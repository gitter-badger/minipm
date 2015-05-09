class AddOwnerReferencesToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :owner, index: true, foreign_key: true
  end
end
