class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end


  def show
    @recipe = Recipe.find(params[:id])
    @needs = @recipe.recipe_needs
    @steps = @recipe.steps
  end


end
