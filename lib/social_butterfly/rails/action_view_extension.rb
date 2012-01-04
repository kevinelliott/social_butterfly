module SocialButterfly
  module Rails
    module ActionViewExtension
      def facebook_share_button_url(content={}, options={})
        content = { :text => '' }.merge(content)
        options = { }.merge(options)
        SocialButterfly::Services::FacebookService.share_button_url(content, options)
      end

      def google_plus_share_button_url(content={}, options={})
        content = { :text => '' }.merge(content)
        options = { }.merge(options)
        SocialButterfly::Services::GooglePlusService.share_button_url(content, options)
      end

      def twitter_share_button_url(content={}, options={})
        content = { :text => 'Check this out -- ' }.merge(content)
        options = { :via => '' }.merge(options)
        SocialButterfly::Services::TwitterService.share_button_url(content, options)
      end
    end
  end
end