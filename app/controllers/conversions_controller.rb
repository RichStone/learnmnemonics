class ConversionsController < ApplicationController
  def new
    create
  end

  def create
    redirect_to new_brain_session_path unless current_brain

    conversion = MajorSystemConverter.new(current_brain, conversions_create_params)

    if conversion
      # TODO: Redirect to new major system.
      # TODO: Converting is a process that can take time. Do it synchronously
      # and display progress with turbo.
    else
      # TODO: Something went wrong.
    end
  end

  private

  def conversions_create_params
    params.require(:resource).permit(:id)
  end
end
