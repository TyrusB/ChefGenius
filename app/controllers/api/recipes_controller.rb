class Api::RecipesController < ApplicationController
  #before_filter :user_authenticated?

  def index
    @recipes = Recipe.all
    render "recipes/collection"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps
    @ingredients = @recipe.ingredients
    @note = @recipe.note
    @info = @recipe.info

    render "recipes/model"
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render "recipes/model"
    else
      render :json => @recipe.errors.full_messages, :status => 404
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
      params.require(:recipes).permit( :name,
                                       :steps_attributes => [:description],
                                       :info_attributes => [:prep_time, :cook_time],
                                       :ingredients_attributes => [:description],
                                       :note_attributes => [:description]
                                    )

    end

end