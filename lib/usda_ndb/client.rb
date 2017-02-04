module UsdaNdb
  class Client
    def self.fetch(endpoint, params={})
      defaults = {
        api_key: UsdaNdb.configuration.api_key,
        format: UsdaNdb.configuration.response_format
      }
      address = UsdaNdb.configuration.endpoint_base
      params = defaults.merge(params)
      response = RestClient.get "#{address}/#{endpoint}", params: params
      result = response.body
      result = JSON.parse(result) if UsdaNdb.configuration.response_format == 'json'
      result
    end
  end
end
