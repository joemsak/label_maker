require 'rails_helper'

RSpec.describe LabelMaker::Case do
  it 'builds from the given filter id' do
    VCR.use_cassette('build cases from filter id') do
      cases = described_class.build(2275373)

      cases.each do |desk_case|
        expect(desk_case.id).not_to be_nil
        expect(desk_case.blurb).not_to be_empty
      end
    end
  end
end
