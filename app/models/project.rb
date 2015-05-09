class Project < ActiveRecord::Base
  # Associations
  has_many :tasks, dependent: :destroy
  has_many :memberships
  has_many :members, class_name: 'User', through: 'memberships',
    foreign_key: 'member_id'

  belongs_to :owner, class_name: 'User'

  # Attachment
  # attachment :project_image

  # Validations
  validates :title, presence: true
  validates :due_date, presence: true

  # Format date
  def format_date
    self.due_date.strftime('%e %B %Y')
  end

  def unfinished_tasks
    self.tasks.where(finished: false)
  end

  def finished_tasks
    self.tasks.where(finished: true)
  end

  # Model name in url
  def to_param
    "#{id}-#{title}".parameterize
  end
end
