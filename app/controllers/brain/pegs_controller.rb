class Brain::PegsController < ApplicationController
  def edit
    @peg = Peg.find(params[:id])
  end

  def update
    peg = Peg.find(params[:id])

    if peg.update(peg_params)
      redirect_to edit_brain_peg_path(peg), notice: "Your peg was successfully updated"
    else
      flash.now[:alert] = "Something went wrong"
    end
  end

  private

  def peg_params
    params.require(:peg).permit(:number, :phrase)
  end
end
