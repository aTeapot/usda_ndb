class UsdaNdbGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  def create_initializer_file
    #create_file "config/initializers/usda_ndb.rb"
    copy_file 'usda_ndb.rb', 'config/initializers/usda_ndb.rb'
  end
end
