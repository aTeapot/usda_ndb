module UsdaNdb
  class Configuration
    DEFAULT_API_KEY = 'DEMO_KEY'
    DEFAULT_ENDPOINT_BASE = 'http://api.nal.usda.gov/ndb'
    DEFAULT_FORMAT = 'json'

    attr_accessor :api_key, :endpoint_base, :response_format

    def initialize
      @api_key = DEFAULT_API_KEY
      @endpoint_base = DEFAULT_ENDPOINT_BASE
      @response_format = DEFAULT_FORMAT
    end
  end
end
