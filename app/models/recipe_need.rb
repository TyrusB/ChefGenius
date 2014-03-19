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

  def formatted_amount
    if self.amount % 1 == 0.0
      unit = self.amount.to_i
    else
      unit = self.amount
    end

    if (unit == 1) && (self.amount_type[-1] == "s")
      type = self.amount_type.singularize
    else
      type = self.amount_type
    end

    "#{unit} #{type}"
  end

end
