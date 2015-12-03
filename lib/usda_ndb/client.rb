module UsdaNdb
  class Client
    def self.fetch(endpoint, params={})
      defaults = {
        api_key: UsdaNdb.api_key,
        format: UsdaNdb.format
      }
      address = UsdaNdb.endpoint_base
      params = defaults.merge(params)
      json = RestClient.get "#{address}/#{endpoint}", params: params
      JSON.parse(json)
    end
  end
end
