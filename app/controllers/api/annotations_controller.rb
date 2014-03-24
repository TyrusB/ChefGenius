class Api::AnnotationsController < ApplicationController

  def create
    @annotation = Annotation.new(annotation_params)
    fail
  end


  private

    def annotation_params
      params.require(:annotations).permit(:annotatable_id, :annotatable_type, :content)
    end

end
