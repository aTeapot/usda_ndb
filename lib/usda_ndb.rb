require 'usda_ndb/client'
require 'usda_ndb/version'
require 'rest-client'

module UsdaNdb
  def self.reports(ndbno, params={})
    UsdaNdb::Client.fetch(:reports, params.merge(ndbno: ndbno.to_s))
  end

  def self.search(search_term, params={})
    UsdaNdb::Client.fetch(:search, params.merge(q: search_term))
  end

  def self.list(search_term, params={})
    UsdaNdb::Client.fetch(:list, params.merge(q: search_term))
  end
end
