# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  description :text             not null
#  recipe_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Step < ActiveRecord::Base
  validates :description, :presence => true

  belongs_to :recipe

end
