module ApplicationHelper
  def crud_links(object)
    links = ''
    links += "<td>#{link_to "Show", object}</td> "
    links += "<td>#{link_to "Edit", [:edit, object]}</td> "
    links += "<td>#{link_to "Destroy", object, method: :delete, data: {confirm: 'Are you sure?'}}</td>"

    links.html_safe
  end
end
