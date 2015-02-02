require 'rails_helper'

RSpec.describe LabelMaker::CaseFilter do
  it 'takes a name and id' do
    filter = described_class.new(id: 123, name: 'label name')

    expect(filter.id).to eq(123)
    expect(filter.name).to eq('label name')
  end

  it 'raises CaseFilterNotFoundError on invalid IDs' do
    expect {
      described_class.find('invalidId')
    }.to raise_error(LabelMaker::CaseFilterNotFoundError)
  end

  it 'finds by ID' do
    stub_case_filter_find(123, { 'id' => 123, 'name' => 'label name' })

    filter = described_class.find(123)

    expect(filter.id).to eq(123)
    expect(filter.name).to eq('label name')
  end
end
