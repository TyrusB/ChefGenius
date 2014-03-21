class Api::RecipesController < ApplicationController
  before_filter :user_authenticated?

  def index
    @recipes = Recipe.all
    render "recipes/collection"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @needs = @recipe.recipe_needs
    @steps = @recipe.steps

    render "recipes/model"
  end

  def create
    steps_params = recipe_params["steps"]
    needs_params = recipe_params["recipe_needs"]

    recipe_only_params = recipe_params.reject { |k, _| k == "recipe_needs" || k == "steps" }

    @recipe = Recipe.new(recipe_only_params)

    @recipe.steps.build(steps_params)
    @recipe.recipe_needs.build(needs_params)

    if @recipe.save
      render "recipes/model"
    else
      render :json => @recipe.errors.full_messages
    end
  end

  private

  def user_authenticated?
    if !user_signed_in?
      render :json => {}
      return false
    end
  end

  def recipe_params
    params.require(:recipes).permit(:name, :prep_time, :cook_time, :notes,
                                    :recipe_needs => [:amount, :amount_type, :ingredientName],
                                    :steps => [:description] )
  end

end


  # def edit
#     @recipe = Recipe.find(params[:id])
#
#     @needs = @recipe.recipe_needs
#     2.times { @needs += [RecipeNeed.new] }
#
#     @steps = @recipe.steps
#     2.times { @steps += [Step.new] }
#   end


 # def new
#    @recipe = Recipe.new
#
#    @needs = []
#    2.times { @needs << RecipeNeed.new }
#
#    @steps = []
#    2.times { @steps << Step.new }
#  end