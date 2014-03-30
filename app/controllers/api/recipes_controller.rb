class Api::RecipesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => :create

  def index
    @recipes = Recipe.all
    render "recipes/collection"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps.includes(:annotations)
    @ingredients = @recipe.ingredients.includes(:annotations)
    @note = @recipe.note
    @info = @recipe.info

    render "recipes/model"
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      @steps = @recipe.steps.includes(:annotations)
      @ingredients = @recipe.ingredients.includes(:annotations)
      @note = @recipe.note
      @info = @recipe.info
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
      params.require(:recipes).permit( :name, :title_photo, :category,
                                       :steps_attributes => [:description],
                                       :info_attributes => [:prep_time, :cook_time],
                                       :ingredients_attributes => [:description],
                                       :note_attributes => [:description]
                                    ).merge(:author => current_user)
                                     .each do |_, field_array|
                                      next if !field_array.is_a? Array
                                      field_array.reject! { |input_group| input_group.values.all?(&:blank?) }
                                    end

    end

end