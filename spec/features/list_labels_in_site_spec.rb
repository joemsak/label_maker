require 'rails_helper'

RSpec.describe 'List labels in the site' do
  scenario 'No labels on the site' do
    allow(LabelMaker::Http).to receive(:get) {
      { '_embedded' => { 'entries' => [] } }
    }

    visit label_maker_labels_path

    expect(page).to have_content(I18n.t('text.models.label.none'))
  end

  scenario 'Some labels on the site' do
    VCR.use_cassette('list  all labels') do
      visit label_maker_labels_path

      @labels = LabelMaker::Label.all

      @labels.each do |label|
        expect(page).to have_css(".label.#{label.color}", text: label.name)
      end
    end
  end
end
