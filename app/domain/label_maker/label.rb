module LabelMaker
  class Label < RemoteResource
    include ActiveModel::Model

    attr_accessor :name, :description, :enabled, :types, :color

    def self.list_endpoint
      '/labels'
    end
  end
end
