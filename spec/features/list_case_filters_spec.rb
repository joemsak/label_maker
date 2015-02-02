require 'rails_helper'

RSpec.feature 'List case filters' do
  scenario 'No items in the list' do
    allow(LabelMaker::CaseFilter).to receive(:all) { [] }

    visit label_maker_case_filters_path

    expect(page).to have_content(I18n.t('text.models.case_filter.none'))
  end

  scenario 'Some items in the list' do
    VCR.use_cassette('visit case filters list') do
      visit label_maker_case_filters_path

      expect(page).not_to have_content(I18n.t('text.models.case_filter.none'))

      expect(page).to have_link('My Cases',
                                href: label_maker_case_filter_path('2275373'))
    end
  end
end
