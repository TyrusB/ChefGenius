# == Schema Information
#
# Table name: annotations
#
#  id               :integer          not null, primary key
#  content          :text
#  annotatable_id   :integer
#  annotatable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  start_pos        :integer          not null
#  end_pos          :integer          not null
#  author_id        :integer          not null
#

class Annotation < ActiveRecord::Base
  belongs_to :annotatable, :polymorphic => true
  belongs_to :author, :class_name => "User"

  delegate :recipe, :to => :annotatable

  has_many :suggestions
end
