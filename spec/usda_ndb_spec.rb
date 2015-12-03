require 'spec_helper'

describe UsdaNdb do
  it 'has a version number' do
    expect(UsdaNdb::VERSION).not_to be nil
  end

  describe '#reports' do
    it 'fetches report' do
      UsdaNdb::Client.class_eval do
        API_KEY = 'DEMO_KEY'
      end
      result = UsdaNdb.reports('01009')
      expect(result['report']['food']['name']).to eq 'Cheese, cheddar'
    end
  end
end
