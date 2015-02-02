require 'rails_helper'

RSpec.describe LabelMaker::CaseFilter do
  it 'takes a name and id' do
    filter = described_class.new(id: 123, name: 'label name')

    expect(filter.id).to eq(123)
    expect(filter.name).to eq('label name')
  end
end
