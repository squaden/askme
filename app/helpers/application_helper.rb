module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declension(number, vopros, voprosa, voprosov)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    remainder1 = number % 100
    if remainder1 >= 11 && remainder1 <= 14
      voprosov
    end

    remainder2 = number % 10
    if remainder2 == 1
      vopros
    elsif remainder2 >= 2 && remainder2 <= 4
      voprosa
    else
      voprosov
    end
  end
end
