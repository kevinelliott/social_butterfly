module SocialButterfly
  module Rails
    class ActionViewExtension
      def facebook_share_button_url(content={}, options={})
        content = { :url  => polymorphic_url(self), :text => '' }.merge(content)
        options = { }.merge(options)
        SocialButterfly::Services::FacebookService.share_button_url(content, options)
      end

      def google_plus_share_button_url(content={}, options={})
        content = { :url  => polymorphic_url(self), :text => '' }.merge(content)
        options = { }.merge(options)
        SocialButterfly::Services::GooglePlusService.share_button_url(content, options)
      end

      def twitter_share_button_url(content={}, options={})
        content = { :url => polymorphic_url(self), :text => 'Check this out -- ' }.merge(content)
        options = { }.merge(options)
        SocialButterfly::Services::TwitterService.share_button_url(content, options)
      end
    end
  end
end