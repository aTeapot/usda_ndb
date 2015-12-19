module UsdaNdb
  class Client
    def self.fetch(endpoint, params={})
      defaults = {
        api_key: UsdaNdb.configuration.api_key,
        format: UsdaNdb.configuration.response_format
      }
      address = UsdaNdb.configuration.endpoint_base
      params = defaults.merge(params)
      json = RestClient.get "#{address}/#{endpoint}", params: params
      JSON.parse(json, symbolize_names: true)
    end
  end
end
