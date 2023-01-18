class ConversionsController < ApplicationController
  def new
    create
  end

  def create
    redirect_to new_brain_session_path unless current_brain
  end
end
