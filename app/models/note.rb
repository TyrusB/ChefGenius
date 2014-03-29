# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  description :text
#  recipe_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Note < ActiveRecord::Base
  include Annotatable

  validates :description, :presence => true

  belongs_to :recipe

end
