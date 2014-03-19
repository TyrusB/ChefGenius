class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end


  def show
    @recipe = Recipe.find(params[:id])
    @needs = @recipe.recipe_needs
    @steps = @recipe.steps
  end

  def edit
    @recipe = Recipe.find(params[:id])

    @needs = @recipe.recipe_needs
    2.times { @needs += [RecipeNeed.new] }

    @steps = @recipe.steps
    2.times { @steps += [Step.new] }
  end

  def new
    @recipe = Recipe.new()
  end

end
