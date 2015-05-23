module ApplicationHelper
  # Pretty title page
  def title(page_title = '')
    base_title = 'Project Manager'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Check user if the owner of a project
  def is_the_owner?(project)
   (project.owner_id == current_user.id) || current_user.try(:admin?)
  end
end
