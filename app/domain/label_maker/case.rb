module LabelMaker
  class Case < RemoteResource
    attr_accessor :external_id, :blurb, :priority, :locked_until, :label_ids,
      :active_at, :changed_at, :created_at, :updated_at, :first_opened_at,
      :opened_at, :first_resolved_at, :resolved_at, :status, :description,
      :language, :received_at, :type, :labels, :subject, :custom_fields

    def self.list_endpoint
      '/cases'
    end

    def self.build(filter_id)
      map_remote("/filters/#{filter_id}#{list_endpoint}")
    end

    def assign_label(label_id)
      label = Label.find(label_id)
      self.class.update(id, labels: [label.name])
    end

    def labels=(labels)
      @labels = label_ids.map { |i| Label.find(i) }
    end
  end
end
