require 'rails_helper'

RSpec.describe 'Show cases of a selected filter' do
  scenario 'No cases in filter' do
    VCR.use_cassette('find case filter by id') do
      visit label_maker_case_filter_path(2275374) # Has no cases
    end

    expect(page).to have_content(I18n.t('text.models.case.none'))
  end

  scenario 'Some cases in the filter' do
    VCR.use_cassette('find case filter by id', record: :all) do
      visit label_maker_case_filter_path(2275373)
      @case_filter = LabelMaker::CaseFilter.find(2275373)
    end

    expect(page).not_to have_content(I18n.t('text.models.case.none'))

    @case_filter.cases.each do |desk_case|
      expect(page).to have_content(desk_case.blurb)
    end
  end
end
