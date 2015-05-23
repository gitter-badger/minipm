class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def update?
    user == task.project.owner || user.try(:admin?)
  end

  def new?
    update?
  end

  def create?
    update?
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
