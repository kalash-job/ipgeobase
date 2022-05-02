# frozen_string_literal: true

require_relative "../test_helper"

class TestIpgeobase < Minitest::Test
  IP_ADDRESS = "8.8.8.8"
  FIXTURE_RESPONSE_FILE_PATH = "/fixtures/files/example_curl_response.json"

  def setup
    stub_request(:get, "#{Ipgeobase::API_URL}#{IP_ADDRESS}")
      .to_return(body: File.read("../#{File.dirname(__FILE__)}#{FIXTURE_RESPONSE_FILE_PATH}"), status: 200)
    @meta_data = Ipgeobase.lookup(IP_ADDRESS)
  end

  def test_city
    assert_equal("Ashburn", @meta_data.city)
    # assert { @meta_data.city == "Ashburn" }
  end

  def test_country
    assert_equal("United States", @meta_data.country)
    # assert { @meta_data.country == "United States" }
  end

  def test_country_code
    assert_equal("US", @meta_data.country_code)
    # assert { @meta_data.country_code == "US" }
  end

  def test_lon
    assert_equal("-77.5", @meta_data.lon)
    # assert { @meta_data.lon == "-77.5" }
  end

  def test_lat
    assert_equal("39.03", @meta_data.lat)
    # assert { @meta_data.lat == "39.03" }
  end
end
