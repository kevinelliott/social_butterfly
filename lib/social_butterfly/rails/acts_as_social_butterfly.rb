module SocialButterfly::Rails::ActsAsSocialButterfly
  def acts_as_social_butterfly
    include InstanceMethods
  end

  module InstanceMethods
  end
end
ActiveRecord::Base.extend SocialButterfly::Rails::ActsAsSocialButterfly