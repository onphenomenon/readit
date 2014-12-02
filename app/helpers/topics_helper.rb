module TopicsHelper
  def crud_links(object)
    if current_user == User.find(2)
      links = ''
      links += "<td>#{ link_to 'Show', object}</td> "
      links += "<td>#{ link_to 'Edit', [:edit, object]}</td> "
      links += "<td>#{link_to 'Destroy', object, method: :delete, data: { confirm: 'Are you sure?' }}</td>"

    else
      links = '<td>     </td>'

    end
    links.html_safe

  end
end
