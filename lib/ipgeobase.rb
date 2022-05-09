# frozen_string_literal: true

require_relative "ipgeobase/version"
require "addressable"
require "net/http"

module Ipgeobase
  autoload :IpgeoResponseParser, "ipgeobase/ipgeo_response_parser"
  API_URL = "http://ip-api.com/xml/"

  def self.lookup(ip)
    uri = Addressable::URI.parse("#{API_URL}#{ip}")
    res = Net::HTTP.get_response(uri)
    raise "Incorrect response of ip-api.com service" unless res.is_a?(Net::HTTPSuccess)

    IpgeoResponseParser.parse(res.body, single: true)
  end
end
