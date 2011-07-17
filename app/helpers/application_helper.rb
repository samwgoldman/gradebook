module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |f|
      render(association.to_s.singularize + '_fields', :f => f)
    end
    link_to_function(name, %Q[add_fields(this, "#{association}", "#{escape_javascript(fields)}")])
  end
end
