# == Schema Information
#
# Table name: recipe_needs
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  amount        :float
#  amount_type   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class RecipeNeed < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

end
