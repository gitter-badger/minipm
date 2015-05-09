class Membership < ActiveRecord::Base
  # Associations
  belongs_to :member, class_name: 'User'
  belongs_to :project

  # Validates membership
  validates :project_id, uniqueness: { scope: :member_id }
end
