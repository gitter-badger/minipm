class Task < ActiveRecord::Base
  # Associations
  belongs_to :project
  belongs_to :owner, class_name: User

  has_many :assignments, dependent: :destroy, foreign_key: :task_id
  has_many :assignees, class_name: User, through: 'assignments',
    foreign_key: 'assignee_id'

  # Validations
  validates :title, presence: true
  validates :project_id, presence: true
end
