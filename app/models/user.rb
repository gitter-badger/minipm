class User < ActiveRecord::Base
  # Associations
  has_many :tasks,       foreign_key: 'owner_id'
  has_many :projects,    foreign_key: 'owner_id'
  has_many :assignments, foreign_key: 'assignee_id'
  has_many :memberships, foreign_key: 'member_id'

  has_many :shared_projects, class_name: 'Project', through: 'memberships',
    foreign_key: 'member_id', source: :project

  has_many :shared_assignments, class_name: 'Task', through: 'assignments',
    foreign_key: 'assignee_id', source: :task

  # Authlogic
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::SCrypt
  end

  # Login using login or email
  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end

  # Validations
  # TODO: Create basic user validations
end
