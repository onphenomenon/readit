module PostsHelper
  def favorite_form2
    form_for Favorite.new do |f|
      f.hidden_field :fav_save, value: "save"
      f.hidden_field :post_id, value: @post.id
      f.submit value: 'Save to Favorites'
    end
  end
end

def crud_post(object)
  if object.user == current_user
    links = ''
    links += "<ul class='button-group [tiny secondary]'>"
    links += "<li class='button tiny secondary'>#{ link_to 'Edit', edit_topic_post_path(object.topic, object) }"
    links += "<li class='button tiny secondary'>#{ link_to 'Destroy', [object.topic, object], method: :delete, data: {confirm: 'Are you sure?'}}"
    links += "</ul>"
  end
  links
end

def crud_comment
  if @comment.user == current_user || @post.user == current_user
    links = ''
    links += "class='button tiny secondary'>#{ link_to 'delete', @comment, method: :delete, data: {confirm: 'Are you sure?'} }</li>"
  end
  links
end
