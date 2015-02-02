module LabelMaker
  class CaseFilter
    include ActiveModel::Model

    attr_accessor :id, :name, :position, :active, :routing_enabled, :sort_field,
      :sort_direction, :_links

    def self.all
      get_filters['_embedded']['entries'].map { |f| new(f) }
    end

    def self.find(id)
      filter = get_filter(id)
      if persisted?(filter)
        new(filter)
      else
        raise CaseFilterNotFoundError
      end
    end

    def to_param
      id.to_s
    end

    private
    def self.get_filter(id)
      get_filters(id)
    end

    def self.get_filters(id = nil)
      suffix = id ? "/#{id}" : ''
      Http.get("/filters#{suffix}")
    end

    def self.persisted?(hashie_data)
      hashie_data.respond_to?(:[]) && hashie_data['id']
    end
  end

  class CaseFilterNotFoundError < StandardError; end
end
