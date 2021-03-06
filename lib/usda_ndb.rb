require 'usda_ndb/client'
require 'usda_ndb/version'
require 'usda_ndb/configurable'
require 'usda_ndb/configuration'
require 'rest-client'
require 'json'

module UsdaNdb
  extend UsdaNdb::Configurable

  def self.reports(ndbno, params={})
    UsdaNdb::Client.fetch(:reports, params.merge(ndbno: ndbno.to_s))
  end

  def self.search(search_term, params={})
    UsdaNdb::Client.fetch(:search, params.merge(q: search_term))
  end

  def self.list(params={})
    UsdaNdb::Client.fetch(:list, params)
  end
end
