require 'json'

class StaticPagesController < ApplicationController
  before_filter :authenticate_user!

  def home
    @recipes = Recipe.all
    @recipes_json = @recipes.to_json.html_safe
    @user_json = { email: current_user.email, id: current_user.id }.to_json.html_safe
  end

  def test
  end

  def test2
  end

end
