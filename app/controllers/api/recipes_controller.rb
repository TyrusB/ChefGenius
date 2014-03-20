class Api::RecipesController < ApplicationController

  # def edit
#     @recipe = Recipe.find(params[:id])
#
#     @needs = @recipe.recipe_needs
#     2.times { @needs += [RecipeNeed.new] }
#
#     @steps = @recipe.steps
#     2.times { @steps += [Step.new] }
#   end

  def index
    @recipes = Recipe.all
    render "recipes/collection"
  end

  # def new
 #    @recipe = Recipe.new
 #
 #    @needs = []
 #    2.times { @needs << RecipeNeed.new }
 #
 #    @steps = []
 #    2.times { @steps << Step.new }
 #  end

  def show

    @recipe = Recipe.find(params[:id])
    @needs = @recipe.recipe_needs
    @steps = @recipe.steps

    render "recipes/model"
  end

  def update
    fail
  end

end
