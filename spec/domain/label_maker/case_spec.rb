require 'rails_helper'

RSpec.describe LabelMaker::Case do
  it 'gets cases from the given filter id' do
    VCR.use_cassette('build cases from filter id') do
      cases = described_class.in_filter(2275373)

      cases.each do |desk_case|
        expect(desk_case.id).not_to be_nil
        expect(desk_case.blurb).not_to be_empty
      end
    end
  end

  it 'assigns labels by id' do
    VCR.use_cassette('assign a label to a case by id') do
      desk_case = described_class.find(1)

      desk_case.assign_label(2177275)

      desk_case = described_class.find(1) # reload from api

      expect(desk_case.label_ids).to include(2177275)
    end
  end
end
