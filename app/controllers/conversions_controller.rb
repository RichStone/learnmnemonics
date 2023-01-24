class ConversionsController < ApplicationController
  def new
    create
  end

  def create
    return redirect_to new_brain_session_path unless current_brain

    original = MajorSystem.find(resource_conversion_params[:id])
    conversion = MajorSystem.create!(
      origin: original.origin,
      origin_url: original.origin_url,
      language_iso: original.language_iso,
      brain: current_brain
    )

    if conversion
      redirect_to brain_major_system_path(conversion),
        notice: "Successfully shoved into brain"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def resource_conversion_params
    params.require(:resource).permit(:id)
  end
end
