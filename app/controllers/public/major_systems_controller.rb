class Public::MajorSystemsController < ApplicationController
  def index
    @languages = MajorSystem.original.group(:language_iso).pluck(:language_iso)
    @major_systems = MajorSystem.original.language(major_systems_params[:language_iso])
  end

  def show
    @major_system = MajorSystem.find(major_system_params[:id])
  end

  private

  def major_systems_params
    params.permit(:language_iso)
  end

  def major_system_params
    params.permit(:id)
  end
end
