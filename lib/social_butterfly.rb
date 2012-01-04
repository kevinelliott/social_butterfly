module SocialButterfly
  def self.frameworks
    frameworks = []
    case
      when rails?   then frameworks << 'rails'
    end
    frameworks
  end

  def self.load_framework!
    show_warning if frameworks.empty?
    frameworks.each do |framework|
      begin
        require framework
      rescue NameError => e
        raise "Failed to load framework #{framework.inspect}. Have you added it to Gemfile?"
      end
    end
  end
  
  def self.show_warning
      $stderr.puts <<-EOC
  warning: no framework detected.
  would you check out if your Gemfile appropriately configured?
  ---- e.g. ----
  when Rails:
      gem 'rails'
      gem 'social_butterfly'

      EOC
  end
  
  def self.load_social_butterfly!
    require 'social_butterfly/version'
    require 'social_butterfly/services'
    require 'social_butterfly/helpers/social_butterfly_helper'
  end
  
  def self.hook!
    load_framework!
    load_social_butterfly!
    require 'social_butterfly/hooks'
    if rails?
      require 'social_butterfly/rails/action_view_extension'
      require 'social_butterfly/rails/railtie'
      require 'social_butterfly/rails/engine'
    else
      SocialButterfly::Hooks.init!
    end
  end
  
  def self.load!
    hook!
  end
  
  private
  
  def self.rails?
    defined?(::Rails)
  end
end

SocialButterfly.load!