module ApplicationHelper

  def error_msg(object)
    add = ''
    object.errors.full_messages.each do |msg|
      add += "<tr>#{msg}</tr>"
    end
    add.html_safe
  end

  def favorite_form
    form_for Favorite.new do |f|
      f.hidden_field :fav_save, value: "save"
      f.hidden_field :post_id, value: @post.id
      f.submit value: 'Save to Favorites'
    end
  end
end
