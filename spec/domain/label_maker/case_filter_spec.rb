require 'rails_helper'

RSpec.describe LabelMaker::CaseFilter do
  it 'takes a name and id' do
    filter = described_class.new(id: 123, name: 'label name')

    expect(filter.id).to eq(123)
    expect(filter.name).to eq('label name')
  end

  it 'raises CaseFilterNotFoundError on invalid IDs' do
    VCR.use_cassette('invalid case filter id') do
      expect {
        described_class.find('invalidId')
      }.to raise_error(LabelMaker::ResourceNotFoundError)
    end
  end

  it 'finds by ID' do
    VCR.use_cassette('find case filter by id') do
      filter = described_class.find(2275373)

      expect(filter.id).to eq(2275373)
      expect(filter.name).to eq('My Cases')
    end
  end
end
