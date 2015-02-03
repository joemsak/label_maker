module LabelMaker
  class CasesController < ApplicationController
    def assign
      desk_case = LabelMaker::Case.find(params[:id])
      desk_case.assign_label(params[:label_id])
      redirect_to :back
    end
  end
end
