class Project < ActiveRecord::Base
  # Validations
  validates :title, presence: true
  validates :due_date, presence: true

  # Format date
  def format_date
    self.due_date.strftime('%B %e, %Y')
  end
end
