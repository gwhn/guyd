# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def selected_element_if(element, condition, attributes = {}, & block)
    attributes['class'] = 'selected' if condition
    content_tag(element, attributes, & block)
  end

  def build_menu(sections, selected = nil, options = {})
    content_tag(:ul, :class => options[:class]) do
      sections.collect do |section|
        selected_element_if(:li, section == selected) do
          li = link_to(section.name, section)
          li << build_menu(section.children, selected) if section.children.count > 0
          li
        end
      end
    end
  end
end
