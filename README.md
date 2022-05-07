![Ipgeobase-Github-Actions](https://github.com/kalash-job/ipgeobase/workflows/Ipgeobase/badge.svg)
# Ipgeobase

The Ipgeobase gem returns metadata by IP. The gem contains a lookup('8.8.8.8') method that accept an IP address and returns a metadata object.
Ipgeobase uses the service ip-api.com which allows you to get information by IP - for example, country, city, coordinates.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ipgeobase

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ipgeobase

## Usage
How to use gem Ipgeobase:
```ruby
ip_meta = Ipgeobase.lookup('8.8.8.8')
ip_meta.city # Ashburn
ip_meta.country # United States
ip_meta.countryCode # US
ip_meta.lat # 39.03
ip_meta.lon # -77.5
```