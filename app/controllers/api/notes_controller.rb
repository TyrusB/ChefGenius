class Api::NotesController < ApplicationController
  load_and_authorize_resource

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(notes_params)
      render "notes/model"
    else
      render :json => {}
    end
  end

  private

    def notes_params
      params.require(:notes).permit(:description)
    end
end
