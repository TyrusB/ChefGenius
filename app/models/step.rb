# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  description :text             not null
#  ord         :integer          not null
#  recipe_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Step < ActiveRecord::Base
  validates :description, :ord, :presence => true
  validates :ord, :uniqueness => { :scope => :recipe_id }

  belongs_to :recipe

end
