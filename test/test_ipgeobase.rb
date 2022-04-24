# frozen_string_literal: true

require_relative "test_helper"
require_relative "../lib/ipgeobase"

class TestIpgeobase < Minitest::Test
  PREPARED_JSON_RESPONSE = '{"status":"success","country":"United States","countryCode":"US",
    "region":"VA","regionName":"Virginia","city":"Ashburn","zip":"20149","lat":39.03,"lon":-77.5,
    "timezone":"America/New_York","isp":"Google LLC","org":"Google Public DNS","as":"AS15169 Google LLC",
    "query":"8.8.8.8"}'

  def setup
    stub_request(:get, "http://ip-api.com/json/8.8.8.8")
      .to_return PREPARED_JSON_RESPONSE
    @meta_data = Ipgeobase.lookup("8.8.8.8")
  end

  def test_city
    assert { @meta_data.city == "Ashburn" }
  end

  def test_country
    assert { @meta_data.country == "United States" }
  end

  def test_country_code
    assert { @meta_data.country_code == "US" }
  end

  def test_lon
    assert { @meta_data.lon == "-77.5" }
  end

  def test_lat
    assert { @meta_data.lat == "39.03" }
  end
end
