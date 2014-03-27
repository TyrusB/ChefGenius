class Api::SuggestionsController < ApplicationController
  def create
    @suggestion = Suggestion.new(suggestion_params)

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
