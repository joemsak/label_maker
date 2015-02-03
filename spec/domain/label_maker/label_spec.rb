require 'rails_helper'

RSpec.describe LabelMaker::Label do
  it 'takes a name and id' do
    filter = described_class.new(id: 123, name: 'label name')

    expect(filter.id).to eq(123)
    expect(filter.name).to eq('label name')
  end

  it 'raises LabelNotFoundError on invalid IDs' do
    VCR.use_cassette('invalid label id') do
      expect {
        described_class.find('invalidId')
      }.to raise_error(LabelMaker::ResourceNotFoundError)
    end
  end

  it 'finds by ID' do
    VCR.use_cassette('find label by id') do
      filter = described_class.find(2177275)

      expect(filter.id).to eq(2177275)
      expect(filter.name).to eq('Abandoned Chats')
      expect(filter.color).to eq('default')
    end
  end

  it 'creates with a name' do
    VCR.use_cassette('create label with a name') do
      label = LabelMaker::Label.create(name: 'Cool Label')

      expect(label['id']).not_to be_nil
      expect(label['name']).to eq('Cool Label')
    end
  end
end
