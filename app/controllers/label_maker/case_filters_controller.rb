class LabelMaker::CaseFiltersController < ApplicationController
  def index
    @case_filters = LabelMaker::CaseFilter.all
  end
end
