# == Schema Information
#
# Table name: infos
#
#  id        :integer          not null, primary key
#  cook_time :string(255)
#  prep_time :string(255)
#  recipe_id :integer
#

class Info < ActiveRecord::Base
  validates :cook_time, :prep_time, :presence => true

  belongs_to :recipe

end
