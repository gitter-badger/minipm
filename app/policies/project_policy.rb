class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user    = user
    @project = project
  end

  def edit?
    update?
  end

  def update?
    user == project.owner || user.try(:admin?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
