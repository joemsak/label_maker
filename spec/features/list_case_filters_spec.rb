require 'rails_helper'

RSpec.feature 'List case filters' do
  scenario 'No items in the list' do
    visit label_maker_case_filters_path
    expect(page).to have_content(I18n.t('text.models.case_filter.none'))
  end
end
