module SocialButterfly
  class Hooks
    def self.init!
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, SocialButterfly::Rails::ActionViewExtension
      end
    end
  end
end