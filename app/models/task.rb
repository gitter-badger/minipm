class Task < ActiveRecord::Base
  # Associations
  belongs_to :project

  # Validations
  validates :title, presence: true
end
