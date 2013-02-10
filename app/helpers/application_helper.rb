module ApplicationHelper
  def nav_link(body, url)
    content_tag(:li, :class => ('active' if current_page?(url))) do
      link_to body, url
    end
  end
end
