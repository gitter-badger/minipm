class Assignment < ActiveRecord::Base
  # Associations
  belongs_to :assignee, class_name: User
  belongs_to :task

  # Validates assignment
  validates :task_id, uniqueness: { scope: :assignee_id }
end
