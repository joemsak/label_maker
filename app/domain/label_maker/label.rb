module LabelMaker
  class Label < RemoteResource
    attr_accessor :name, :description, :enabled, :types, :color

    def self.list_endpoint
      '/labels'
    end
  end
end
