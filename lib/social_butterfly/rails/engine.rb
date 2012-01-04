require "social_butterfly"
require "social_butterfly/rails"
require "rails"

module SocialButterfly
  class Engine < ::Rails::Engine
    initializer 'social_butterfly.ar_extensions', :before=>"action_controller.deprecated_routes" do |app|
      ActiveRecord::Base.extend SocialButterfly::Rails::ActsAsSocialButterfly
    end
    
    config.to_prepare do
      ActionView::Base.send(:include, SocialButterflyHelper)
    end
  end
end