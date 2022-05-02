# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"

module Ipgeobase
  autoload :IpgeoResponseParser, "ipgeobase/ipgeo_response_parser"
  API_URL = "http://ip-api.com/json/"

  def self.lookup(ip)
    uri = URI("#{API_URL}#{ip}")
    res = Net::HTTP.get_response(uri)
    raise "Incorrect response of ip-api.com service" unless res.is_a?(Net::HTTPSuccess)

    IpgeoResponseParser.new(res.body)
  end
end
