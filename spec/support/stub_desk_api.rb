module DeskApiHelpers
  def stub_desk_api_entries(body)
    allow(DeskApi).to receive(:get) {
      OpenStruct.new(body: "{\"_embedded\" : { \"entries\" : #{body} } }")
    }
  end
end
