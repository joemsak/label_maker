module LabelMaker
  class CaseFilter
    include ActiveModel::Model

    attr_accessor :id, :name

    def self.all
      []
    end

    def to_param
      id.to_s
    end
  end
end
