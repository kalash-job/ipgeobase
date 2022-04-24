module Ipgeobase
  require "net/http"
  require "json"

  class Ipgeo
    attr_reader :city, :country, :country_code, :lon, :lat

    def initialize(ip)
      uri = URI("http://ip-api.com/json/#{ip}")
      res = Net::HTTP.get_response(uri)
      raise "Incorrect response of ip-api.com service" unless res.is_a?(Net::HTTPSuccess)

      ip_meta = JSON.parse(res.body)
      @city = ip_meta.fetch("city", nil)
      @country = ip_meta.fetch("country", nil)
      @country_code = ip_meta.fetch("countryCode", nil)
      @lat = ip_meta.fetch("lat", nil).to_s
      @lon = ip_meta.fetch("lon", nil).to_s
    end
  end
end
