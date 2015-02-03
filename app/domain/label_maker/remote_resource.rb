module LabelMaker
  class RemoteResource
    include ActiveModel::Model

    attr_accessor :id, :_links

    def self.all
      map_embedded_entries(list_endpoint)
    end

    def self.create(attrs = {})
      Api::Desk.post(list_endpoint, attrs)
    end

    def self.find(id)
      resource = get("#{list_endpoint}/#{id}")
      if persisted?(resource)
        new(resource)
      else
        raise ResourceNotFoundError
      end
    end

    def self.get(endpoint)
      Api::Desk.get(endpoint)
    end

    def self.update(id, body)
      Api::Desk.put("#{list_endpoint}/#{id}", body)
    end

    def to_param
      id.to_s
    end

    private
    def self.map_embedded_entries(endpoint)
      resp = get(endpoint)
      resp['_embedded']['entries'].map { |d| new(d) }
    end

    def self.persisted?(hashie_data)
      hashie_data.respond_to?(:[]) && hashie_data['id']
    end
  end

  class ResourceNotFoundError < StandardError; end
end
