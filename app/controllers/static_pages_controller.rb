class StaticPagesController < ApplicationController
  before_filter :authenticate_user!

  def home
    @recipes = Recipes.all
  end

  def test
  end

  def test2
  end

end
