# The super admin part of the application.
class Admin::PegsController < ApplicationController
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:basic_auth_username),
    password: Rails.application.credentials.dig(:basic_auth_password)
  )

  before_action :set_peg, only: %i[ show edit update destroy ]

  # GET /pegs
  def index
    # TODO: The sorting will break with 0-prepended pegs like "00", "01", etc.
    if !filter_params[:set_id]
      # FIXME: Only showing German ones as default, while other admins work on it.
      # 43 seems like magic 42 but actually stands for Stenger's peg set.
      # @pegs = Peg.all.ordered
      @pegs = Peg.where(mnemonic_system_id: 43).ordered
    else
      @pegs = Peg.where(mnemonic_system_id: filter_params[:set_id]).ordered
    end
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
      redirect_to admin_peg_url(@peg), notice: "Peg was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pegs/1
  def update
    if @peg.update(peg_params)
      redirect_to admin_peg_url(@peg), notice: "Peg was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pegs/1
  def destroy
    @peg.destroy

    redirect_to admin_pegs_url, notice: "Peg was successfully destroyed."
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

    def filter_params
      params.permit(:set_id)
    end
end
