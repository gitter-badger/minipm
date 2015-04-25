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
end
