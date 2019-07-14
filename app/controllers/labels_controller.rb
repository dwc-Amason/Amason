class LabelsController < ApplicationController

  def create
  	@label = Label.new(label_params)
  	@label.save
  end

  def index
  	@labels = Label.all
  	@label = Label.new
  end

  def edit
  	@label = Label.find(params[:id])
  end

  def update
  	@label.update
  end

  private
  def label_params
	params.require(:label).permit(:name)
  end
end
