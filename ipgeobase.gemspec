# frozen_string_literal: true

require_relative "lib/ipgeobase/version"

Gem::Specification.new do |spec|
  spec.name = "ipgeobase"
  spec.version = Ipgeobase::VERSION
  spec.authors = ["Nikolay Kalashnikov"]
  spec.email = ["kalash-job@yandex.ru"]

  spec.summary = "Gem Ipgeobase returns metadata about IP."
  spec.description = "Gem Ipgeobase returns metadata about IP from ip-api.com service."
  spec.homepage = "https://github.com/kalash-job/ipgeobase"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "https://github.com/kalash-job/ipgeobase"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kalash-job/ipgeobase"
  spec.metadata["changelog_uri"] = "https://github.com/kalash-job/ipgeobase"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "minitest-power_assert"
  spec.add_development_dependency "webmock"
  spec.add_runtime_dependency "addressable"
  spec.add_runtime_dependency "nokogiri-happymapper"
  spec.add_runtime_dependency "rake"
end
