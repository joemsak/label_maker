require 'rails_helper'

RSpec.feature 'List case filters' do
  scenario 'No items in the list' do
    stub_desk_api_entries('[]')

    visit label_maker_case_filters_path

    expect(page).to have_content(I18n.t('text.models.case_filter.none'))
  end

  scenario 'Some items in the list' do
    stub_desk_api_entries('[{ "id" : "123456", "name" : "My Cases" },
                            { "id" : "654321", "name" : "Inbox" }]')

    visit label_maker_case_filters_path

    expect(page).not_to have_content(I18n.t('text.models.case_filter.none'))

    expect(page).to have_link('My Cases',
                              href: label_maker_case_filter_path('123456'))

    expect(page).to have_link('Inbox',
                              href: label_maker_case_filter_path('654321'))
  end
end
