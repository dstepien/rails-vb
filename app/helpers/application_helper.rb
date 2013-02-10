module ApplicationHelper
  def nav_link(body, url, active_for_subpages = true)
    active = active_for_subpages ?
      Rails.application.routes.recognize_path(url)[:controller] == params[:controller] :
      current_page?(url)

    content_tag(:li, :class => ('active' if active)) do
      link_to body, url
    end
  end
end
