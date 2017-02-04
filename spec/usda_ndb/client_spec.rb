require 'spec_helper'

RSpec.describe UsdaNdb::Client do
  describe '.fetch' do
    context 'without VCR' do
      api_key = 'key'

      before(:all) do
        UsdaNdb.configure { |c| c.api_key = api_key }
      end
      after(:all) do
        UsdaNdb.reset_configuration
        configure_usda_ndb
      end

      let(:search_term) { 'arugula' }
      let(:response) { OpenStruct.new(body: '{"foo":"bar"}') }
      let(:search_address) do
        "#{UsdaNdb::Configuration::DEFAULT_ENDPOINT_BASE}/search"
      end
      let(:params) do
        {
            api_key: api_key,
            format: 'json',
            q: search_term
        }
      end

      before do
        allow(RestClient).to receive(:get).with(search_address, params: params)
                         .and_return(response)
      end

      it 'constructs and parses the request' do
        result = described_class.fetch(:search, q: search_term)
        expect(result).to eq({'foo' => 'bar'})
      end
    end

    context 'with VCR' do
      before(:all) { configure_vcr }

      it 'fetches given endpoint' do
        VCR.use_cassette('list 20') do
          result = described_class.fetch(:list, max: 20)
          items = result['list']['item']
          expect(items.class).to eq Array
          expect(items.length).to eq 20
        end
      end

      context 'when configured to return xml' do
        before(:all) { UsdaNdb.configure { |c| c.response_format = 'xml' } }
        after(:all) { UsdaNdb.configure { |c| c.response_format = 'json' } }

        subject do
          VCR.use_cassette('xml') do
            described_class.fetch(:list, max: 1)
          end
        end

        it 'does not parse it as JSON' do
          expect(JSON).not_to receive(:parse)
          subject
        end

        it 'returns an xml string' do
          expect(subject).to match /\A<\?xml/
        end
      end
    end
  end
end
