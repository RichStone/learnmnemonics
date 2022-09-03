class PegsController < ApplicationController
  before_action :set_peg, only: %i[ show edit update destroy ]

  # GET /pegs or /pegs.json
  def index
    # TODO: The sorting will break with 0-prepended pegs like "00", "01", etc.
    @pegs = Peg.all.sort_by {|peg| peg.number.to_i}
  end

  # GET /pegs/1 or /pegs/1.json
  def show
  end

  # GET /pegs/new
  def new
    @peg = Peg.new
  end

  # GET /pegs/1/edit
  def edit
  end

  # POST /pegs or /pegs.json
  def create
    @peg = Peg.new(peg_params)

    respond_to do |format|
      if @peg.save
        format.html {
          redirect_to peg_url(@peg), notice: "Peg was successfully created."
        }
        format.json { render :show, status: :created, location: @peg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pegs/1 or /pegs/1.json
  def update
    respond_to do |format|
      if @peg.update(peg_params)
        format.html {
          redirect_to peg_url(@peg),
            notice: "Peg was successfully updated."
        }
        format.json { render :show, status: :ok, location: @peg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pegs/1 or /pegs/1.json
  def destroy
    @peg.destroy

    respond_to do |format|
      format.html {
        redirect_to pegs_url,
          notice: "Peg was successfully destroyed."
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peg
      @peg = Peg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peg_params
      params.require(:peg).permit(:image, :number, :phrase)
    end
end
