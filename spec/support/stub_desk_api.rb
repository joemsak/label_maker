module DeskApiHelpers
  def stub_desk_api_entries(body)
    allow(DeskApi).to receive(:get) {
      OpenStruct.new(body: "{\"_embedded\" : { \"entries\" : #{body} } }")
    }
  end

  def stub_case_filter_find(id, response)
    allow(LabelMaker::Http).to receive(:get).with("/filters/#{id}")
      .and_return(response)
  end
end
