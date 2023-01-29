class Brain::ConversionsController < ApplicationController
  before_action :authenticate_brain!

  def new
    create
  end

  def create
    original = MajorSystem.find(resource_conversion_params[:id])
    conversion = MajorSystemConverter.convert(original, current_brain)

    if conversion
      redirect_to brain_major_system_path(conversion),
        notice: "Successfully shoved into brain"
    else
      render :show, status: :unprocessable_entity
    end

  rescue MajorSystemConverter::ConversionLimitReachedError => e
    redirect_to brain_major_systems_path, alert: e.message
  end

  private

  def resource_conversion_params
    params.require(:resource).permit(:id)
  end
end
