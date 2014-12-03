module ApplicationHelper
  def link_to_i(icon, text, path, options={})
    link_to("<i class='fi-#{icon}'></i> #{text}".html_safe, path, options)
  end
end
