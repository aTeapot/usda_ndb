require 'spec_helper'

RSpec.describe UsdaNdb do
  it 'has a version number' do
    expect(UsdaNdb::VERSION).not_to be nil
  end

  describe '.reports' do
    it 'fetches report' do
      result = UsdaNdb.reports('01009')
      expect(result['report']['food']['name']).to eq 'Cheese, cheddar'
    end
  end

  describe '.list' do
    it 'list foods, food groups, nutrients etc.' do
      result = UsdaNdb.list(lt: 'g')
      items = result['list']['item']
      expect(items[1]['name']).to eq 'Baby Foods'
    end
  end

  describe '.search' do
    it 'searches for items with given name' do
      result = UsdaNdb.search('arugula')
      items = result['list']['item']
      expect(items[0]['name']).to eq 'Arugula, raw'
    end
  end
end
