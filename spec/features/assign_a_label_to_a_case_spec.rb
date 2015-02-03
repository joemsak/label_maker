require 'rails_helper'

RSpec.feature 'Assign a label to a case' do
  scenario 'Assign from the case filter cases list' do
    VCR.use_cassette('assign a label to a case') do
      visit label_maker_case_filter_path(2275373)

      within('.label_maker_case:first-child') do
        select 'Hello World', from: :label_id
        click_button I18n.t('forms.buttons.assign')

        expect(page).to have_css('.label.default', text: 'Hello World')
      end
    end
  end
end
