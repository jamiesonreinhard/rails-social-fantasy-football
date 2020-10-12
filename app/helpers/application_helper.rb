module ApplicationHelper
  def user_avatar(user, size=40)
    if user.photo.attached?
      user.photo.key
    else
      current_user.gravatar_url
    end
  end
end
