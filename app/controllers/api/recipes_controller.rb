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
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render "recipes/model"
    else
      render :json => @recipe.errors.full_messages
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    render :json => @recipe
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
                                      :recipe_needs_attributes => [:amount, :amount_type, :ingredientName],
                                      :steps_attributes => [:description] )
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