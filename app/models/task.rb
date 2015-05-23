class Task < ActiveRecord::Base
  # Callbacks
  after_commit :send_email_to_assignees, on: :create

  # Associations
  belongs_to :project
  belongs_to :owner, class_name: User

  has_many :assignments, dependent: :destroy, foreign_key: :task_id
  has_many :assignees, class_name: User, through: 'assignments',
    foreign_key: 'assignee_id'

  # Validations
  validates :title, presence: true
  validates :project_id, presence: true

  private

  def send_email_to_assignees
    self.assignees.each do |assignee|
      TaskMailer.send_task(assignee, self).deliver_later(queue: 'low')
    end
  end
end
