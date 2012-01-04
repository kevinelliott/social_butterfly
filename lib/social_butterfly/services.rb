require 'social_butterfly/services/facebook_service'
require 'social_butterfly/services/google_plus_service'
require 'social_butterfly/services/twitter_service'

module SocialButterfly
  module Services
    VALID_SERVICES = [
      :facebook,
      :google_plus,
      :twitter
    ]
    
    def self.track(content, options={})
      results = {}
      results[:facebook]    = SocialButterfly::Services::FacebookService.track(content, options)
      results[:google_plus] = SocialButterfly::Services::GooglePlusService.track(content, options)
      results[:twitter]     = SocialButterfly::Services::TwitterService.track(content, options)
      results
    end
  end
end