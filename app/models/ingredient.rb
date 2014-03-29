# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  description :string(255)
#  recipe_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Ingredient < ActiveRecord::Base
  include Annotatable

  validates :description, :presence => true

  belongs_to :recipe

end
