require 'rails_helper'

RSpec.feature 'Create a label' do
  scenario 'Add a label to the list' do
    VCR.use_cassette('create a label', record: :all) do
      visit label_maker_labels_path

      click_link I18n.t('links.controllers.labels.new')

      fill_in :label_maker_label_name, with: 'My new label'
      click_button I18n.t('forms.buttons.submit')

      expect(page).to have_css('.flash.notice',
                           text: I18n.t('text.controllers.labels.create.success'))
      expect(page).to have_css('.label.default', text: 'My new label')
    end
  end
end
