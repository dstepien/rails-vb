module ApplicationHelper
  def nav_link(body, url, active_for_subpages = true)
    active = current_page?(url)

    if active_for_subpages
      controller = url.is_a?(Hash) ? url[:controller] :
        Rails.application.routes.recognize_path(url)[:controller]
      active = controller == params[:controller]
    end

    content_tag(:li, :class => ('active' if active)) do
      link_to body, url
    end
  end
end
