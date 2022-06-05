class MajorSystemPegsController < ApplicationController
  before_action :set_major_system_peg, only: %i[ show edit update destroy ]

  # GET /major_system_pegs or /major_system_pegs.json
  def index
    # TODO: The sorting will break with 0-prepended pegs like "00", "01", etc.
    @major_system_pegs = MajorSystemPeg.all.sort_by {|peg| peg.number.to_i}
  end

  # GET /major_system_pegs/1 or /major_system_pegs/1.json
  def show
  end

  # GET /major_system_pegs/new
  def new
    @major_system_peg = MajorSystemPeg.new
  end

  # GET /major_system_pegs/1/edit
  def edit
  end

  # POST /major_system_pegs or /major_system_pegs.json
  def create
    @major_system_peg = MajorSystemPeg.new(major_system_peg_params)

    respond_to do |format|
      if @major_system_peg.save
        format.html { redirect_to major_system_peg_url(@major_system_peg), notice: "Major system peg was successfully created." }
        format.json { render :show, status: :created, location: @major_system_peg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @major_system_peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /major_system_pegs/1 or /major_system_pegs/1.json
  def update
    respond_to do |format|
      if @major_system_peg.update(major_system_peg_params)
        format.html { redirect_to major_system_peg_url(@major_system_peg), notice: "Major system peg was successfully updated." }
        format.json { render :show, status: :ok, location: @major_system_peg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @major_system_peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /major_system_pegs/1 or /major_system_pegs/1.json
  def destroy
    @major_system_peg.destroy

    respond_to do |format|
      format.html { redirect_to major_system_pegs_url, notice: "Major system peg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major_system_peg
      @major_system_peg = MajorSystemPeg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def major_system_peg_params
      params.require(:major_system_peg).permit(:image, :number, :phrase)
    end
end
