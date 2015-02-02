module LabelMaker
  class RemoteResource
    attr_accessor :id, :_links

    def self.all
      map_remote(list_endpoint)
    end

    def self.map_remote(endpoint)
      resp = get_http(endpoint)
      resp['_embedded']['entries'].map { |d| new(d) }
    end

    private
    def self.get_http(endpoint)
      Http.get(endpoint)
    end

    def self.persisted?(hashie_data)
      hashie_data.respond_to?(:[]) && hashie_data['id']
    end
  end
end
