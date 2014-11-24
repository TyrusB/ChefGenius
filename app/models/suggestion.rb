# == Schema Information
#
# Table name: suggestions
#
#  id            :integer          not null, primary key
#  content       :text
#  annotation_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  author_id     :integer          not null
#

class Suggestion < ActiveRecord::Base
  belongs_to :annotation
  belongs_to :author, :class_name => "User"

  delegate :recipe, :to => :annotation
end
