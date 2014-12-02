module TopicsHelper
  def crud_links(object)
    # binding.pry
    return '<td> </td>'.html_safe if current_user.nil? || !current_user.is_admin?
    links = ''
    links += "<td>#{ link_to 'Show', object}</td> "
    links += "<td>#{ link_to 'Edit', [:edit, object]}</td> "
    links += "<td>#{link_to 'Destroy', object, method: :delete, data: { confirm: 'Are you sure?' }}</td>"

    links.html_safe
  end
end
