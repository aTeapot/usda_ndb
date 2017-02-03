require 'spec_helper'

RSpec.describe UsdaNdb do
  before(:all) { configure_vcr }

  it 'has a version number' do
    expect(UsdaNdb::VERSION).not_to be nil
  end

  describe '.reports' do
    it 'fetches report' do
      VCR.use_cassette('reports') do
        result = UsdaNdb.reports('01009')
        expect(result['report']['food']['name']).to eq 'Cheese, cheddar'
      end
    end
  end

  describe '.list' do
    it 'list foods, food groups, nutrients etc.' do
      VCR.use_cassette('list') do
        result = UsdaNdb.list(lt: 'g')
        items = result['list']['item']
        expect(items[1]['name']).to eq 'Baby Foods'
      end
    end
  end

  describe '.search' do
    it 'searches for items with given name' do
      VCR.use_cassette('search') do
        result = UsdaNdb.search('arugula')
        items = result['list']['item']
        expect(items[0]['name']).to eq 'Arugula, raw'
      end
    end
  end
end
