require 'json'

class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :only => :home

  def home
    @recipes = Recipe.all
    @recipes_json = @recipes.to_json.html_safe
    @user_json = { email: current_user.email, id: current_user.id }.to_json.html_safe
  end

  def about
  end

  def contact
  end

end
