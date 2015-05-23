class Project < ActiveRecord::Base
  # Callbacks
  before_validation :generate_slug
  after_commit      :add_owner_to_members, on: :create

  # Associations
  has_many :tasks, dependent: :destroy
  has_many :memberships, dependent: :destroy, foreign_key: :project_id
  has_many :members, class_name: 'User', through: 'memberships',
    foreign_key: 'member_id'

  belongs_to :owner, class_name: 'User'

  # Attachment
  # attachment :project_image

  # Validations
  validates :title,    presence: true
  validates :due_date, presence: true
  validates :slug,     presence: true, uniqueness: true

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
    slug
  end

  private

  # Generate project slug for url
  def generate_slug
    self.slug ||= title.parameterize
  end

  def add_owner_to_members
    self.members << self.owner
  end
end
