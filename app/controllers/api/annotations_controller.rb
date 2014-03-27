class Api::AnnotationsController < ApplicationController

  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      render :json => @annotation
    else
      render :json => @annotation.errors.full_messages, :status => :unproccessable_entity
    end
  end

  def show
    @annotation = Annotation.find(params[:id])
    @suggestions = @annotation.suggestions
    render "annotations/model"
  end


  private

    def annotation_params
      params.require(:annotations).permit(:annotatable_id, :annotatable_type,
                                          :content, :start_pos, :end_pos)
    end

end
