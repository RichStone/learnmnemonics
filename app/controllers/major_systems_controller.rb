class MajorSystemsController < ApplicationController
  before_action :set_major_system, only: %i[ show edit update destroy ]

  # GET /major_systems
  def index
    @major_systems = MajorSystem.all
  end

  # GET /major_systems/1
  def show
  end

  # GET /major_systems/new
  def new
    @major_system = MajorSystem.new
  end

  # GET /major_systems/1/edit
  def edit
  end

  # POST /major_systems
  def create
    @major_system = MajorSystem.new(major_system_params)

    if @major_system.save
      redirect_to @major_system, notice: "Major system was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /major_systems/1
  def update
    if @major_system.update(major_system_params)
      redirect_to @major_system, notice: "Major system was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /major_systems/1
  def destroy
    @major_system.destroy
    redirect_to major_systems_url, notice: "Major system was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major_system
      @major_system = MajorSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def major_system_params
      params.require(:major_system).permit(:origin, :language_iso, :brain_id)
    end
end
