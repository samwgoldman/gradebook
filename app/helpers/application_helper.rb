module ApplicationHelper
  def page_wrapper(&block)
    content_tag :section, capture(&block), :class => resource_class.name.downcase
  end

  def flashes
    flash.keys.map { |key| flash_tag key }.join.html_safe
  end

  def flash_tag(key)
    content_tag :p, flash[key], :class => key
  end

  def edit_link_to(resource)
    link_to polymorphic_path(resource, :action => :edit), :class => 'edit' do
      image_tag 'pencil.png', :alt => "Edit #{resource.class.name.titleize}"
    end
  end

  def delete_link_to(resource)
    link_to polymorphic_path(resource), :method => :delete, :class => 'delete' do
      image_tag 'delete.png', :alt => "Delete #{resource.class.name.titleize}"
    end
  end

  def errors_for(resource, attribute)
    content_tag :ul, :class => 'errors' do
      resource.errors[attribute].map do |error|
        content_tag :li, error
      end.join.html_safe
    end
  end
end
