module ApplicationHelper
  def gravatar_for(user, s={size: 48})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{s[:size]}"
    image_tag(gravatar_url, alt:"User Gravatar", class:"gravatar three columns")
  end
end
