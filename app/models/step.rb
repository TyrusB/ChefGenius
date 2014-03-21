# == Schema Information
#
# Table name: steps
#
#  id        :integer          not null, primary key
#  body      :text
#  recipe_id :integer
#

class Step < ActiveRecord::Base
  validates :body, :presence => true

  belongs_to :recipe

end
