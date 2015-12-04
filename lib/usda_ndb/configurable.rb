module UsdaNdb
  module Configurable
    def self.extended(_base)
      attr_accessor :configuration
    end

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def reset_configuration
      self.configuration = Configuration.new
    end
  end
end
