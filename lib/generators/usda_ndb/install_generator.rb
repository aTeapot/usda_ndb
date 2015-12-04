module UsdaNdb
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      desc 'Creates UsdaNdb initializer for your application'

      def copy_initializer
        template 'usda_ndb.rb', 'config/initializers/usda_ndb.rb'
      end
    end
  end
end
