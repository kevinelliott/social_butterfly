class SocialButterfly::Services::TwitterService > SocialButterfly::AbstractService
  def share_button_url(content, service_options={})
    "http://twitter.com/share?" +
      "url=" + content[:url] +
      "&text=" + content[:text] +
      "&via=" + service_options[:via] +
      "&count=none"
  end
  
  def track(content, service_options={})
    url = "http://urls.api.twitter.com/1/urls/count.json?url=#{content[:url]}"
    stats = {}
    result = JSON.parse(open(url).read)
    
    if result.present? && result['count'].present?
      stats[:shares] = result['count']
    else
      stats[:shares] = 0
    end
    stats
  end
end