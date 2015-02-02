module LabelMaker
  class Label < RemoteResource
    include ActiveModel::Model

    attr_accessor :name, :description, :enabled, :types, :color

    def self.create(attrs = {})
      Http.post("/labels", attrs)
    end

    def self.list_endpoint
      '/labels'
    end

    def self.find(id)
      label = get_http("/labels/#{id}")
      if persisted?(label)
        new(label)
      else
        raise LabelNotFoundError
      end
    end
  end

  class LabelNotFoundError < StandardError; end
end
