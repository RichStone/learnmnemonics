class Brain::MajorSystemsController < ApplicationController
  before_action :authenticate_brain!

  def index
    @major_systems = current_brain.major_systems
  end

  def show
    @major_system = current_brain.major_systems.find(major_system_params)
  end

  def destroy
    @major_system = current_brain.major_systems.find(major_system_params)

    if @major_system.destroy
      redirect_to brain_major_systems_path, notice: "Successfully forgotten"
    else
      flash[:alert] = "There was an error removing this system from your brain"
      render :show
    end
  end

  private

  def major_system_params
    params.require(:id)
  end
end
