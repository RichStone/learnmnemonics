class PegsController < ApplicationController
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:basic_auth_username),
    password: Rails.application.credentials.dig(:basic_auth_password)
  )

  before_action :set_peg, only: %i[ show edit update destroy ]

  # GET /pegs
  def index
    # TODO: The sorting will break with 0-prepended pegs like "00", "01", etc.
    @pegs = Peg.all.sort_by {|peg| peg.number.to_i}
  end

  # GET /pegs/1
  def show
  end

  # GET /pegs/new
  def new
    @peg = Peg.new
  end

  # GET /pegs/1/edit
  def edit
  end

  # POST /pegs
  def create
    @peg = Peg.new(peg_params)

    if @peg.save
      redirect_to peg_url(@peg), notice: "Peg was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pegs/1
  def update
    if @peg.update(peg_params)
      redirect_to peg_url(@peg), notice: "Peg was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pegs/1
  def destroy
    @peg.destroy

    redirect_to pegs_url, notice: "Peg was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peg
      @peg = Peg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peg_params
      params.require(:peg).permit(:image, :number, :phrase, :mnemonic_system_id)
    end
end
