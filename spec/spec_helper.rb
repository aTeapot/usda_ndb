$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'usda_ndb'
require 'webmock/rspec'
require 'vcr'

UsdaNdb.configure do |config|
  config.api_key = 'oGnHOdoZI162Yl6gw4SwVsYqFL89ma1eZBVjSla9'
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end
