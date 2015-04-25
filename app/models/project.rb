class Project < ActiveRecord::Base
  # Associations
  has_many :tasks

  # Validations
  validates :title, presence: true
  validates :due_date, presence: true

  # Format date
  def format_date
    self.due_date.strftime('%B %e, %Y')
  end

  # Model name in url
  def to_param
    "#{id}-#{title}".parameterize
  end
end
