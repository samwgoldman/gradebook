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
end
