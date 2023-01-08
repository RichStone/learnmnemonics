class Brain::MajorSystemsController < ApplicationController
  before_action :authenticate_brain!

  def index
    # TODO
  end

  def show
    @major_system = current_brain.major_systems.find(major_system_params)
  end

  private

  def major_system_params
    params.require(:id)
  end
end
