module ApplicationHelper
  def validation(object)
    return if object.nil?
    unless object.errors.empty?
      html = content_tag(:div, content_tag(:h1, "Aconteceu algo de Errado!"))
      object.errors.full_messages.each { |msg| html << content_tag(:li, msg) }
      content_tag(:div, html, class: "validation").html_safe
    end
  end
end
