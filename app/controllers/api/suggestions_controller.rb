class Api::SuggestionsController < ApplicationController
  load_and_authorize_resource
  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.author = current_user

    if @suggestion.save
      render :json => @suggestion
    else
      render :json => :unprocessable_entity
    end
  end

  private

    def suggestion_params
      params.require(:suggestions).permit(:content, :annotation_id)
    end

end
