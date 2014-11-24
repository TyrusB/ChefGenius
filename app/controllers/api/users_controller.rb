class Api::UsersController < ApplicationController

  def show
    @user = User.includes(:recipes, :annotations, :suggestions).find(params[:id])

    render "users/model"
  end

end