class Annotation < ActiveRecord::Base
  belongs_to :annotatable, :polymorphic => true
  belongs_to :author, :class_name => "User"

  has_many :suggestions
end
