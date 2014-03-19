# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Recipe < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true

  has_many :recipe_needs, :dependent => :destroy
  has_many :ingredients, :through => :recipe_needs
  has_many :steps

end
