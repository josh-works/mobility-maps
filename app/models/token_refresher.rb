require "uri"
require "net/http"
require "json"
require 'csv'

class TokenRefresher
  # this works
  def self.refresh_token
    refresh_token = newest_token
    url = URI("https://www.strava.com/oauth/token?client_id=63764&client_secret=2e6c5168e3b97a9c0975e5377041b8a416b4fbf8&refresh_token=#{refresh_token}&grant_type=refresh_token")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)

    response = https.request(request).read_body
    p response
  end

  def self.newest_token
    # data = File.read('tokens.json')
    # p data
    # p data.last
    # p JSON.parse(data.last)
    # data.last["refresh_token"]
    # file = File.read('tokens.json')
    # hash = JSON.parse(file)
    # hash.last

    "932469c09ef3da9dbec99a9c8e8364b0f885b021"
  end
end
