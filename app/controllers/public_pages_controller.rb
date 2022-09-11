class PublicPagesController < ApplicationController
  def home
    # TODO: Create landing page.
  end

  def major_systems
    if params[:language_iso] || params[:system_id]
      # TODO
    else
      # Default major system to show.
      # TODO: Set default language based on locale.
      @major_system = MajorSystem.original.english.preload(:pegs).first
    end
  end
end
