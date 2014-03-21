class Api::NeedsController < ApplicationController

  def update
    @need = RecipeNeed.find(params[:id])

    if @need.update_attributes(needs_params)
      render "needs/model"
    else
      render :json => @need.errors.full_messages
    end

  end


  private

  def needs_params
    params.require(:needs).permit(:amount, :amount_type, :ingredientName)
  end
end
