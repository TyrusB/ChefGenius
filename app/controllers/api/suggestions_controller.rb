class Api::SuggestionsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => :create

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
      params.require(:suggestions).permit(:content, :annotation_id).meger(:author => current_user)
    end

end
