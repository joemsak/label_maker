module LabelMaker
  class Http
    def self.get(endpoint)
      resp = DeskApi.get("#{DeskApiRoot}#{endpoint}")
      JSON.parse(resp.body)
    end

    def self.post(endpoint, body = {})
      resp = DeskApi.post("#{DeskApiRoot}#{endpoint}", body.to_json)
      JSON.parse(resp.body)
    end

    def self.put(endpoint, body = {})
      resp = DeskApi.put("#{DeskApiRoot}#{endpoint}", body.to_json)
      JSON.parse(resp.body)
    end
  end
end
