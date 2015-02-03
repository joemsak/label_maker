module LabelMaker
  class RemoteResource
    include ActiveModel::Model

    attr_accessor :id, :_links

    def self.all
      map_remote(list_endpoint)
    end

    def self.find(id)
      resource = get_http("#{list_endpoint}/#{id}")
      if persisted?(resource)
        new(resource)
      else
        raise ResourceNotFoundError
      end
    end

    def self.map_remote(endpoint)
      resp = get_http(endpoint)
      resp['_embedded']['entries'].map { |d| new(d) }
    end

    def self.update(id, body)
      Http.put("#{list_endpoint}/#{id}", body.to_json)
    end

    def to_param
      id.to_s
    end

    private
    def self.get_http(endpoint)
      Http.get(endpoint)
    end

    def self.persisted?(hashie_data)
      hashie_data.respond_to?(:[]) && hashie_data['id']
    end
  end

  class ResourceNotFoundError < StandardError; end
end
