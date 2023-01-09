class Brain::MajorSystemsController < ApplicationController
  before_action :authenticate_brain!

  def index
    @major_systems = current_brain.major_systems
  end

  def show
    @major_system = current_brain.major_systems.find(major_system_params)
  end

  private

  def major_system_params
    params.require(:id)
  end
end
