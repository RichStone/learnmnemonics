class PublicPagesController < ApplicationController
  def home
    # TODO: Create landing page.
  end

  def major_systems
    @major_systems = MajorSystem.for_public_view.preload(:pegs)
  end
end
