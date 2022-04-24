# frozen_string_literal: true

require_relative "ipgeobase/version"

module Ipgeobase
  autoload :Ipgeo, "ipgeobase/ipgeo"
  def self.lookup(ip)
    Ipgeo.new(ip)
  end
end
