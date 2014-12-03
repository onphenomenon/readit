module PostsHelper
  def favorite_form2
    form_for Favorite.new do |f|
      f.hidden_field :fav_save, value: "save"
      f.hidden_field :post_id, value: @post.id
      f.submit value: 'Save to Favorites'
    end
  end

  def vote_link(post)
    return unless current_user
    return unless current_user.votes.where(post_id: post.id).empty?
    links = ''
    links += "<ul class='button-group [tiny secondary]'>"
    links += "<li class='button tiny secondary'>#{ link_to 'Up', votes_up_path(vote: { post_id: post.id }) }"
    links += "<li class='button tiny secondary'>#{ link_to 'Down', votes_down_path(vote: { post_id: post.id }) }"
    links += "</ul>"
    links.html_safe
  end

  def fav_link(post)
    return unless current_user
    return unless current_user.favorites.where(post_id: post.id).empty?

    "<li>#{ link_to "Add Post to Favorites", favorites_create_path(:post_id => post.id) }</li>"
  end

  def crud_post(object)
    return unless object.user == current_user
    links = ''
    links += "<ul class='button-group [tiny secondary]'>"
    links += "<li class='button tiny secondary'>#{ link_to 'Edit', edit_topic_post_path(object.topic, object) }"
    links += "<li class='button tiny secondary'>#{ link_to 'Destroy', [object.topic, object], method: :delete, data: {confirm: 'Are you sure?'}}"
    links += fav_link(object).to_s
    links += "</ul>"

    links.html_safe
  end

  def crud_comment(comment)
    return unless comment.user == current_user || comment.post.user == current_user
    "<li class='button tiny secondary'>#{ link_to 'delete', comment, method: :delete, data: {confirm: 'Are you sure?'} }</li>".html_safe
  end
end
