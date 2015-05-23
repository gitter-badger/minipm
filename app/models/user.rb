class User < ActiveRecord::Base
  after_initialize :set_default_role, if: :new_record?

  # Associations
  has_many :tasks,       foreign_key: 'owner_id'
  has_many :projects,    foreign_key: 'owner_id', dependent: :destroy
  has_many :assignments, foreign_key: 'assignee_id'
  has_many :memberships, foreign_key: 'member_id'

  has_many :shared_projects, class_name: 'Project', through: 'memberships',
    foreign_key: 'member_id', source: :project

  has_many :shared_assignments, class_name: 'Task', through: 'assignments',
    foreign_key: 'assignee_id', source: :task

  # Roles
  enum role: [:user, :moderator, :admin]

  # Authlogic
  acts_as_authentic do |c|
    # Crypto provider (BCrypt, SCrypt, MD5, etc)
    c.crypto_provider = Authlogic::CryptoProviders::SCrypt
  end

  # Login using login or email
  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end

  # Set default role
  def set_default_role
    self.role ||= :user
  end

  # Validations
  # NOTE: Email, login, and password are handles by Authlogic::Regex
end
