module ApplicationHelper
  def height_conversion(inches)
    divmod_output = inches.divmod(12)
    "#{divmod_output[0]}\' #{divmod_output[1]}\""
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    css_id = column == sort_column ? nil : "sort"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class, :id => css_id}
  end

   def sorts(column, title = nil)
    title ||= column.titleize
    css_class = column == match_sort_column ? "current #{sort_direction}" : nil
    css_id = column == match_sort_column ? nil : "sort"
    direction = column == match_sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class, :id => css_id}
  end
end