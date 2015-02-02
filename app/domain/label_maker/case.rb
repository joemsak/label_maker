module LabelMaker
  class Case
    include ActiveModel::Model

    attr_accessor :id, :external_id, :blurb, :priority, :locked_until,
      :label_ids, :active_at, :changed_at, :created_at, :updated_at,
      :first_opened_at, :opened_at, :first_resolved_at, :resolved_at,
      :status, :description, :language, :received_at, :type, :labels,
      :subject, :custom_fields, :_links

    def self.build(filter_id)
      cases = []
      remote = Http.get("/filters/#{filter_id}/cases")

      remote['_embedded']['entries'].each do |entry|
        cases << new(entry)
      end

      cases
    end
  end
end
