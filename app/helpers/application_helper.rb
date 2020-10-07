module ApplicationHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar
    else
      current_user.gravatar_url
    end
  end
end
