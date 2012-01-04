module SocialButterfly
  module Rails
    class Railtie < ::Rails::Railtie #:nodoc:
      initializer 'social_butterfly' do |app|
        SocialButterfly::Hooks.init!
      end
    end
  end
end