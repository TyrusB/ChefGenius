class Api::StepsController < ApplicationController

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
