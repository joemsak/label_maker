require 'rails_helper'

RSpec.describe LabelMaker::Http do
  describe '.get' do
    it 'forwards the request to DeskApi and JSON parses the response' do
      VCR.use_cassette('get from filters') do
        results = described_class.get('/filters')

        filter = results['_embedded']['entries'][0]
        expect(filter['id']).not_to be_nil
        expect(filter['name']).not_to be_nil
      end
    end
  end

  describe '.post' do
    it 'forwards the request to DeskApi and JSON parses the response' do
      VCR.use_cassette('post to labels') do
        label = described_class.post('/labels', name: 'Cool')

        expect(label['id']).not_to be_nil
        expect(label['name']).to eq('Cool')
      end
    end
  end
end
