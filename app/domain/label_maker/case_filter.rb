module LabelMaker
  class CaseFilter < RemoteResource
    attr_accessor :name, :position, :active, :routing_enabled, :sort_field,
      :sort_direction, :cases

    def self.list_endpoint
      '/filters'
    end

    def _links=(links)
      self.cases = Case.build(id)
    end
  end
end
