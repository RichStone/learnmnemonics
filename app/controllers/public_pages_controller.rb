class PublicPagesController < ApplicationController
  def home
    # TODO: Create landing page.
  end

  def major_systems
    # Default major system to show initially, the rest will be handled by turbo.
    # TODO: Set default language based on locale.
    @major_systems = MajorSystem.original.english.preload(:pegs)
    @major_system = @major_systems.first
  end

  def major_system_pegs
    # The selected one.
    @target = permitted_major_systems_params[:target]
  end

  def major_systems_per_language

  end

  private

  def permitted_major_systems_params
    params.permit(:language_iso, :system_id, :target)
  end
end
