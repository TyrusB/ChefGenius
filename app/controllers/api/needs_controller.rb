class Api::NeedsController < ApplicationController

  def update
    @need = RecipeNeed.find(params[:id])

    if params[:ingredientName]
      @need.ingredient = Ingredient.find_or_create(params[:ingredientName])
    end

    new_params = needs_params.reject { |k, _| k == "ingredientName" }

    if @need.update_attributes(new_params)
      render "needs/model"
    else
      render :json => {}
    end

  end


  private

  def needs_params
    params.require(:needs).permit(:amount, :amount_type, :ingredientName)
  end
end
