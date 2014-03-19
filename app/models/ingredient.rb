# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Ingredient < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :recipe_needs
  has_many :recipes, :through => :recipe_id
end
