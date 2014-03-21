# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  description :string(255)
#  recipe_id   :integer
#

class Ingredient < ActiveRecord::Base
  validates :description, :presence => true

  belongs_to :recipe

end
