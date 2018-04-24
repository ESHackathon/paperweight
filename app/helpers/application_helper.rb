module ApplicationHelper
  def active_link_to(name, path=nil, kontroller=nil)
    if kontroller.present?
      active_class = "active" if params[:controller] == kontroller
    else
      active_class = "active" if current_page?(path)
    end

    link_to(name, path, class: "#{active_class}")
  end
end
