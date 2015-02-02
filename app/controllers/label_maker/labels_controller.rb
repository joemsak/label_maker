module LabelMaker
  class LabelsController < ApplicationController
    def create
      LabelMaker::Label.create(label_params)
      flash[:notice] = t('text.controllers.labels.create.success')
      redirect_to label_maker_labels_path
    end

    def index
      @labels = LabelMaker::Label.all
    end

    def new
      @label = LabelMaker::Label.new
    end

    private
    def label_params
      params.require(:label_maker_label).permit(:name)
    end
  end
end
