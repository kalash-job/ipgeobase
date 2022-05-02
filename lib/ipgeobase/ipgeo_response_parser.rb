# frozen_string_literal: true

module Ipgeobase
  require "json"

  class IpgeoResponseParser
    attr_reader :city, :country, :country_code, :lon, :lat

    def initialize(response)
      ip_meta = JSON.parse(response)
      @city = ip_meta.fetch("city", nil)
      @country = ip_meta.fetch("country", nil)
      @country_code = ip_meta.fetch("countryCode", nil)
      @lat = ip_meta.fetch("lat", nil).to_s
      @lon = ip_meta.fetch("lon", nil).to_s
    end
  end
end
