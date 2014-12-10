module TopicsHelper
  def crud_links(object)
    # binding.pry
    return '<td> </td>'.html_safe if current_user.nil? || !current_user.is_admin?
    links = ''
    links += "<td>#{ link_to 'Modify', [:edit, object]}</td> "
    links += "<td>#{link_to 'Trash', object, method: :delete, data: { confirm: 'Are you sure?' }}</td>"

    links.html_safe
  end

  def topic_link()
    return '<td> </td>'.html_safe if current_user.nil? || !current_user.is_admin?
    links = ''
    links += "<div class='button success radius'>#{ link_to "New Topic", new_topic_path }</div>"
    links.html_safe
  end

  def new_post(object)
    return '<td> </td>'.html_safe if current_user.nil?
    links = ''
    links += "<div class='button success radius'>#{ link_to "New Post", new_topic_post_path(object) }</div>"
    links.html_safe
  end


end
