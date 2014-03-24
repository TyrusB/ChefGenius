class Api::IngredientsController < ApplicationController

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update_attributes(ingredient_params)
      render "ingredients/model"
    else
      render :json => @need.errors.full_messages
    end

  end


  private

  def ingredient_params
    params.require(:ingredients).permit(:description)
  end
end
