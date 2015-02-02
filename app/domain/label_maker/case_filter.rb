module LabelMaker
  class CaseFilter
    include ActiveModel::Model

    attr_accessor :id, :name, :position, :active, :routing_enabled, :sort_field,
      :sort_direction, :_links

    def self.all
      filters_resp = Http.get('/filters')
      filters_resp['_embedded']['entries'].map { |f| new(f) }
    end

    def to_param
      id.to_s
    end
  end
end
