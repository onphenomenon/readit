module ApplicationHelper

  def error_msg(object)
    add = ''

    object.errors.full_messages.each do |msg|
      add << "<tr>#{msg}.&nbsp</tr>"
    end
    add.html_safe
  end

  def red_error_box(object)
    return if object.errors.empty?
    add = ''
    add << "<div class='row error'>"
    add << "<div class='small-12 text-center columns'>"
    add << "<div class='alert-box alert round'>#{ error_msg(object) }</div>"
    add << "</div>"
    add << "</div>"
    add.html_safe
  end

  def favorite_form
    form_for Favorite.new do |f|
      f.hidden_field :fav_save, value: "save"
      f.hidden_field :post_id, value: @post.id
      f.submit value: 'Save to Favorites'
    end
  end

  def topic_bar(object)
    links = ''
    object.each do |topic|
      links << "<ul class='left'>"
      links << "<li>#{ link_to topic.title, topic_path(topic) }</li>"
      links << "</ul>"
    end
    links.html_safe
  end
end


def nav(object)
  navbar = ''
  navbar << "<nav class='top-bar' data-topbar role='navigation'>
  <ul class='title-area'>
    <li class='name'>
      <h1><a href='/topics'>READIT</a></h1>
    </li>
     <!-- Remove the class 'menu-icon' to get rid of menu icon. Take out 'Menu' to just have icon alone -->
    <li class='toggle-topbar menu-icon'><a href='#'><span>Menu</span></a></li>
  </ul>

  <section class='top-bar-section'>
    <!-- Right Nav Section -->
    <ul class='right'>"
      if user_signed_in?
  navbar <<
      "<li class='active'>#{ link_to 'Log Out', destroy_user_session_path, method: :delete }</li>
      <li class='has-dropdown'>
        <a href='#'>Profile</a>
        <ul class='dropdown'>
          <li>#{ link_to 'Edit Profile', edit_user_registration_path }</li>
          <li>#{ link_to 'Favorites', favorites_path }</li>
          <li>#{ link_to 'User Posts', users_comments_path }</li>
          <li>#{ link_to 'User Comments', users_posts_path }</li>
        </ul>
      </li>"
      else
  navbar << "<li class='active'>#{ link_to 'Log In', new_user_session_path }</li>
      <li>#{ link_to 'Register', new_user_registration_path }</li>"
      end
  navbar << "</ul>"


  navbar << topic_bar(object)
  navbar <<
          "</section>
      </nav>"
  navbar.html_safe
end
