class Api::SuggestionsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => :create

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      render "suggestions/model"
    else
      render :json => :unprocessable_entity
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy

    render :json => @suggestion
  end

  private

    def suggestion_params
      params.require(:suggestions).permit(:content, :annotation_id).merge(:author => current_user)
    end

end
