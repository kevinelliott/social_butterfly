require 'open-uri'
require 'json'

class SocialButterfly::AbstractService
  
  def self.share(content, service_options={})
    puts "You must override the share(content, service_options) method."
  end
  
  def self.track(content, service_options={})
    puts "You must override the track(content, service_options) method."
  end

end