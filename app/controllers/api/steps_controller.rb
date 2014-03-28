class Api::StepsController < ApplicationController
  load_and_authorize_resource
  def update
    @step = Step.find(params[:id])

    if @step.update_attributes(steps_params)
      render "steps/model"
    else
      render :json => {}
    end
  end

  private

    def steps_params
      params.require(:steps).permit(:description)
    end
end
