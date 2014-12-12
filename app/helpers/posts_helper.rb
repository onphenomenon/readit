module PostsHelper

  def vote_link(post)
    return unless current_user
    return unless current_user.votes.where(post_id: post.id).empty?
    links = ''
    links += "<li class='button tiny success vote' >#{ link_to 'Up', votes_up_path(vote: { post_id: post.id }) }"
    links += "<li class='button tiny success vote' >#{ link_to 'Down', votes_down_path(vote: { post_id: post.id }) }"
    links.html_safe
  end

  def fav_link(post)
    return unless current_user
    return unless current_user.favorites.where(post_id: post.id).empty?

    "<div>#{ link_to "Add Post to Favorites", favorites_create_path(favorite: { post_id: post.id } )}</div>"
  end

  def crud_post(object)
    return unless object.user == current_user
    links = ''
    links += "<ul class='button-group [tiny secondary]'>"
    links += "<li class='button tiny secondary' >#{ link_to 'Edit', edit_topic_post_path(object.topic, object) }</li>"
    links += "<li class='button tiny secondary'>#{ link_to 'Destroy', [object.topic, object], method: :delete, data: {confirm: 'Are you sure?'}}</li>"
    links += "</ul>"
    links += fav_link(object).to_s

    links.html_safe
  end

  def new_comment(object)
    return unless current_user
    links = ''
    links << "#{link_to 'New Comment', new_comment_path(:post_id => object.id), id: 'new_comment_link', remote: true}"
    links.html_safe

  end


  def crud_comment(comment)
    return unless comment.user == current_user || comment.post.user == current_user
    "<li class='button tiny secondary'>#{ link_to 'delete', comment, method: :delete, data: {confirm: 'Are you sure?'} }</li>".html_safe
  end
end
color="red"
