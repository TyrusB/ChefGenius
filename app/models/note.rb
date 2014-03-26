# == Schema Information
#
# Table name: notes
#
#  id        :integer          not null, primary key
#  body      :text
#  recipe_id :integer
#

class Note < ActiveRecord::Base
  include Annotatable

  validates :description, :presence => true

  belongs_to :recipe

end
