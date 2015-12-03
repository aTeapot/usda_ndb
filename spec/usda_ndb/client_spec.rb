require 'spec_helper'

RSpec.describe UsdaNdb::Client do
  describe '.fetch' do
    it 'should fetch given endpoint' do
      result = UsdaNdb::Client.fetch(:list, max: 20)
      items = result['list']['item']
      expect(items.class).to eq Array
      expect(items.length).to eq 20
    end
  end
end
