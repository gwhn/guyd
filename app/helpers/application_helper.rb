# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def selected_element_if(condition, element, attributes = {}, & block)
    attributes['class'] = 'selected' if condition
    content_tag(element, attributes, & block)
  end

  def build_menu(sections, selected = nil)
    sections.collect do |section|
      selected_element_if(section == selected, :li) do
        link_to(section.name, section) <<
                content_tag(:ul) do
                  build_menu(section.children, selected)
                end if section.children
      end
    end
  end
end
