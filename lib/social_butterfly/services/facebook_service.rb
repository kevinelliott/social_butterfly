require 'social_butterfly/abstract_service'

module SocialButterfly::Services
  class FacebookService < SocialButterfly::AbstractService
    def self.share_button_url(content, service_options={})
      "https://www.facebook.com/sharer/sharer.php?u=#{content[:url]}"
    end
  
    def self.track(content, service_options={})
      url = "http://graph.facebook.com/#{content[:url]}"
      stats = {}
      result = JSON.parse(open(url).read)
    
      if result.present? && result['shares'].present?
        stats[:shares] = result['shares']
      else
        stats[:shares] = 0
      end
      stats
    end
  end
end