module UsdaNdb
  module Configuration
    DEFAULT_API_KEY = 'DEMO_KEY'
    DEFAULT_ENDPOINT_BASE = 'http://api.nal.usda.gov/ndb'
    DEFAULT_FORMAT = 'json'

    attr_accessor :api_key, :endpoint_base, :response_format

    def self.extended(base)
      base.reset
    end

    def reset
      self.api_key = DEFAULT_API_KEY
      self.endpoint_base = DEFAULT_ENDPOINT_BASE
      self.response_format = DEFAULT_FORMAT
    end

    def configure
      yield self
    end
  end
end
