class PublicPagesController < ApplicationController
  def home
    # TODO: Create landing page.
  end

  def major_systems
    @major_systems = MajorSystem.original.preload(:pegs)
  end
end
