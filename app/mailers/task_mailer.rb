class TaskMailer < ApplicationMailer
  # default to: Proc.new { self.assignees.pluck(:email) }, from: 'bot@sample.net'

  # Sending task to user email
  def send_task(assignee, task)
    @assignee = assignee
    @task     = task

    mail to: assignee.email, subject: 'Your new task is here!'
  end
end
