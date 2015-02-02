require 'rails_helper'

RSpec.describe LabelMaker::Http do
  describe '.get' do
    it 'forwards the request to DeskApi and JSON parses the response' do
      jsonResponse = OpenStruct.new(body: '[{"key":"value"}]')

      allow(DeskApi).to receive(:get).with("#{DeskApiRoot}/filters")
                                     .and_return(jsonResponse)

      results = described_class.get('/filters')

      expect(results[0]['key']).to eq('value')
    end
  end
end
