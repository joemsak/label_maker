module LabelMaker
  class Case < RemoteResource
    include ActiveModel::Model

    attr_accessor :external_id, :blurb, :priority, :locked_until, :label_ids,
      :active_at, :changed_at, :created_at, :updated_at, :first_opened_at,
      :opened_at, :first_resolved_at, :resolved_at, :status, :description,
      :language, :received_at, :type, :labels, :subject, :custom_fields

    def self.build(filter_id)
      map_remote("/filters/#{filter_id}/cases")
    end
  end
end
