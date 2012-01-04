require 'social_butterfly/abstract_service'
require 'curb'

module SocialButterfly::Services
  class GooglePlusService < SocialButterfly::AbstractService
    def self.share_button_url(content, service_options={})
      "https://plus.google.com/share?url=" + content[:url]
    end
  
    def self.track(content, service_options={})
      stats = {}
      jsonstring = '[{"method":"pos.plusones.get","id":"p","params":{"nolog":true,"id":"' + content[:url] +'","source":"widget","userId":"@viewer","groupId":"@self"},"jsonrpc":"2.0","key":"p","apiVersion":"v1"}]'
      c = Curl::Easy.http_post("https://clients6.google.com/rpc?key=AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ", jsonstring) do |curl|
        curl.headers['Accept'] = 'application/json'
        curl.headers['Content-Type'] = 'application/json'
        curl.headers['Api-Version'] = '2.2'
      end

      response = JSON.parse(c.body_str)
      if response[0]['error'] == nil
        stats[:shares] = 0
      else
        stats[:shares] = response[0]['result']['metadata']['globalCounts']['count'].round
      end
      stats
    end
  end
end