module UsdaNdb
  class Client
    def self.fetch(endpoint, params)
      defaults = {
        api_key: API_KEY,
        format: 'json'
      }
      address = 'http://api.nal.usda.gov/ndb'
      params = defaults.merge(params)
      json = RestClient.get "#{address}/#{endpoint}", params: params
      JSON.parse(json)
    end
  end
end
