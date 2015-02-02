module LabelMaker
  class LabelsController < ApplicationController
    def index
      @labels = LabelMaker::Label.all
    end
  end
end
