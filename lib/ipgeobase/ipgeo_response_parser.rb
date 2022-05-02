# frozen_string_literal: true

module Ipgeobase
  require "happymapper"

  class IpgeoResponseParser
    include HappyMapper

    tag "query"

    element :city, String
    element :country, String
    element :country_code, String, tag: "countryCode"
    element :lat, String
    element :lon, String
  end
end
