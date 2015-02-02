module LabelMaker
  class CaseFilter < RemoteResource
    include ActiveModel::Model

    attr_accessor :name, :position, :active, :routing_enabled, :sort_field,
      :sort_direction, :cases

    def self.list_endpoint
      '/filters'
    end

    def self.find(id)
      filter = get_http("/filters/#{id}")
      if persisted?(filter)
        new(filter)
      else
        raise CaseFilterNotFoundError
      end
    end

    def to_param
      id.to_s
    end

    def _links=(links)
      self.cases = Case.build(id)
    end
  end

  class CaseFilterNotFoundError < StandardError; end
end
