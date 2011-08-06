module ApplicationHelper
  def page_wrapper(&block)
    content_tag :section, capture(&block)
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
end
