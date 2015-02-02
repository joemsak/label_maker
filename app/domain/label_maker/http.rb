module LabelMaker
  class Http
    def self.get(endpoint)
      resp = DeskApi.get("#{DeskApiRoot}#{endpoint}")
      JSON.parse(resp.body)
    end
  end
end
