class LabelMaker::CaseFiltersController < ApplicationController
  def index
    @case_filters = LabelMaker::CaseFilter.all
  end

  def show
    @case_filter = LabelMaker::CaseFilter.find(params[:id])
  end
end
