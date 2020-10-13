module ApplicationHelper
  def user_avatar(user, size=40)
    if user.photo.attached?
      user.photo.key
    else
      image_path 'icons8-user-male-80 (1).png', class: "football-icon"
    end
  end
end
